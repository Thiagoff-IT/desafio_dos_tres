defmodule DesafioDosTres.MixProject do
  use Mix.Project

  # Adicionado para resolver o UndefinedFunctionError
  def project do
    [
      app: :desafio_dos_tres,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  defp deps do
    []
  end

  # Modificado: agora recebe move_supplier para testes
  def start_game(move_supplier \\ &IO.gets/1) do
    symbols = %{1 => "X", 2 => "O", 3 => "#"}
    initial_board = List.duplicate(List.duplicate(".", 4), 4)
    initial_state = %{
      board: initial_board,
      current_player: 1,
      symbols: symbols,
      last_move: nil,
      player_last_move_types: %{1 => nil, 2 => nil, 3 => nil}
    }
    play_round(initial_state, move_supplier)
  end

  # Alterado para receber move_supplier
  defp play_round(state, move_supplier) do
    display_board(state.board)
    IO.puts("Jogador #{state.current_player} (#{state.symbols[state.current_player]}), é sua vez.")
    IO.puts("Digite a linha e coluna (1-4 separados por espaço, ex: 1 3):")

    case get_move(state, move_supplier) do
      :stop ->
        IO.puts("Teste finalizado.")

      {:ok, row, col} ->
        new_state = process_move(state, row, col)

        cond do
          check_win(new_state.board, state.symbols[state.current_player]) ->
            display_board(new_state.board)
            IO.puts("Jogador #{state.current_player} venceu!")

          board_full?(new_state.board) ->
            display_board(new_state.board)
            IO.puts("Empate!")

          true ->
            play_round(new_state, move_supplier)
        end

      :error ->
        IO.puts("Movimento inválido. Tente novamente.")
        play_round(state, move_supplier)
    end
  end

  # Alterado para receber move_supplier e tratar input vazio como fim
  defp get_move(state, move_supplier) do
    input = move_supplier.("") |> String.trim()

    if input == "" do
      :stop
    else
      case parse_input(input) do
        {:ok, row, col} ->
          validate_move(state, row, col)

        _ ->
          :error
      end
    end
  end

  defp parse_input(input) do
    case String.split(input) |> Enum.map(&Integer.parse/1) do
      [{row, ""}, {col, ""}] -> {:ok, row - 1, col - 1}
      _ -> :error
    end
  end

  defp validate_move(state, row, col) do
    if valid_coordinates?(row, col) do
      cell = get_cell(state.board, row, col)
      current_symbol = state.symbols[state.current_player]

      cond do
        cell == "." ->
          {:ok, row, col}

        cell != current_symbol and overwrite_allowed?(state, row, col) ->
          {:ok, row, col}

        true ->
          :error
      end
    else
      :error
    end
  end

  defp valid_coordinates?(row, col) do
    row in 0..3 and col in 0..3
  end

  defp get_cell(board, row, col) do
    board
    |> Enum.at(row)
    |> Enum.at(col)
  end

  defp overwrite_allowed?(state, row, col) do
    last_move = state.last_move
    last_was_overwrite = last_move && last_move.type == :overwrite
    last_cell = last_move && last_move.cell
    last_player = last_move && last_move.player

    # Verifica se o jogador não está substituindo consecutivamente
    if state.player_last_move_types[state.current_player] == :overwrite do
      IO.puts("Regra de sobrescrever consecutivamente: Você não pode sobrescrever seu próprio movimento consecutivamente.")
      false
    else
      # Verifica regra contra vingança
      if last_was_overwrite && last_player != state.current_player && {row, col} == last_cell do
        IO.puts("Regra contra vingança: Você não pode substituir imediatamente a peça de outro jogador na posição {#{row + 1}, #{col + 1}}.")
        false
      else
        true
      end
    end
  end

  defp process_move(state, row, col) do
    current_symbol = state.symbols[state.current_player]
    new_board = update_board(state.board, row, col, current_symbol)

    move_type = if get_cell(state.board, row, col) == ".", do: :place, else: :overwrite

    new_last_move = %{
      type: move_type,
      cell: {row, col},
      player: state.current_player
    }

    new_player_last_move_types =
      Map.put(state.player_last_move_types, state.current_player, move_type)

    next_player = rem(state.current_player, 3) + 1

    %{
      state
      | board: new_board,
        current_player: next_player,
        last_move: new_last_move,
        player_last_move_types: new_player_last_move_types
    }
  end

  defp update_board(board, row, col, symbol) do
    List.update_at(board, row, fn r ->
      List.replace_at(r, col, symbol)
    end)
  end

  defp check_win(board, symbol) do
    check_rows(board, symbol) ||
      check_columns(board, symbol) ||
      check_diagonals(board, symbol)
  end

  defp check_rows(board, symbol) do
    Enum.any?(board, fn row -> Enum.all?(row, &(&1 == symbol)) end)
  end

  defp check_columns(board, symbol) do
    Enum.any?(0..3, fn col ->
      Enum.all?(0..3, fn row ->
        get_cell(board, row, col) == symbol
      end)
    end)
  end

  defp check_diagonals(board, symbol) do
    diagonal1 = Enum.all?(0..3, fn i -> get_cell(board, i, i) == symbol end)
    diagonal2 = Enum.all?(0..3, fn i -> get_cell(board, i, 3 - i) == symbol end)
    diagonal1 || diagonal2
  end

  defp board_full?(board) do
    Enum.all?(board, fn row ->
      Enum.all?(row, &(&1 != "."))
    end)
  end

  defp display_board(board) do
    board
    |> Enum.each(fn row ->
      IO.puts(Enum.join(row, " "))
    end)
  end
end

# Para iniciar o jogo, execute:
# DesafioDosTres.start_game()
