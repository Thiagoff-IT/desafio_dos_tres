ExUnit.start()

defmodule TestMoveSupplier do
  # Inicia um agente para armazenar os movimentos
  def new(moves), do: Agent.start_link(fn -> moves end)

  # Função que retorna um lambda para fornecer os movimentos
  def supplier(pid) do
    fn _prompt ->
      Agent.get_and_update(pid, fn
        [] -> { "", [] }
        [h | t] -> { h, t }
      end)
    end
  end
end

defmodule GameTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "jogo roda e finaliza sem erros" do
    # Define os movimentos; aqui, apenas "" para finalizar imediatamente
    {:ok, pid} = TestMoveSupplier.new([""])
    output = capture_io(fn ->
      DesafioDosTres.MixProject.start_game(TestMoveSupplier.supplier(pid))
    end)
    assert output =~ "Teste finalizado."
  end
end
