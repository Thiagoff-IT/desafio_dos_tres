# Desafio dos Três

Um jogo de estratégia para 3 jogadores, inspirado no Jogo da Velha, mas com regras adicionais e um tabuleiro 4x4. Desenvolvido em Elixir como parte de um desafio de programação funcional.

---

## 🎯 Objetivo

Ser o primeiro jogador a alinhar **4 símbolos consecutivos** (horizontal, vertical ou diagonal) no tabuleiro 4x4.

---

## 🎮 Regras do Jogo

1. **Número de Jogadores:** 3 jogadores.
2. **Símbolos:** Cada jogador escolhe um símbolo único (`X`, `O`, `#`).
3. **Tabuleiro:** Um grid de 4x4, inicialmente vazio.
4. **Turnos:**
   - Os jogadores jogam em turnos rotativos: Jogador 1 → Jogador 2 → Jogador 3 → Jogador 1 → ...
   - Em cada turno, o jogador pode:
     - Colocar seu símbolo em uma célula vazia.
     - Apagar o símbolo de um oponente escrevendo por cima (substituir o símbolo).
5. **Vencedor:**
   - O primeiro jogador a alinhar 4 de seus símbolos consecutivos vence.
   - Se o tabuleiro for preenchido sem um vencedor, o jogo termina em empate.
6. **Regras Especiais:**
   - **Regra contra a Vingança:** Um jogador não pode apagar o símbolo que acabou de ser jogado no turno imediatamente anterior por outro jogador que apagou seu símbolo.
   - **Regra de Apagar Símbolos:** Um jogador não pode apagar símbolos em dois turnos consecutivos. Se ele apagou no turno anterior, deve jogar em uma célula vazia no turno atual.

---

## 🚀 Como Executar o Jogo

### Pré-requisitos
- [Elixir](https://elixir-lang.org/install.html) instalado na sua máquina.

### Passos para Executar
1. Clone o repositório:
   ```bash
   git clone https://github.com/seu-usuario/desafio-dos-tres.git
   cd desafio-dos-tres
   ```

2. Execute o script do jogo:
   ```bash
   elixir script.exs
   ```

3. Siga as instruções exibidas no terminal para jogar.

---

## 🛠️ Implementação

O jogo foi implementado em **Elixir**, uma linguagem funcional moderna, seguindo os princípios de programação funcional:

- **Imutabilidade:** O tabuleiro é representado como uma lista de listas, e cada jogada gera um novo tabuleiro.
- **Recursão:** O loop principal do jogo é implementado usando recursão.
- **Funções Puras:** As funções de verificação de vitória e de realização de jogadas são puras, sem efeitos colaterais.

---

## 🧩 Estrutura do Código

- **`script.exs`:** Contém a lógica principal do jogo.
  - Inicialização do tabuleiro.
  - Loop de turnos.
  - Verificação de vitória ou empate.
  - Regras especiais do jogo.
- **Funções Principais:**
  - `inicializar_tabuleiro/0`: Cria um tabuleiro 4x4 vazio.
  - `jogar/5`: Controla o loop do jogo.
  - `vencedor?/2`: Verifica se um jogador venceu.
  - `realizar_jogada/5`: Executa a jogada (colocar ou apagar símbolo).

---

## 📝 Melhorias Futuras

- Adicionar uma interface gráfica simples.
- Implementar um modo multiplayer online.
- Adicionar suporte para salvar e carregar partidas.

---

## 🤝 Contribuição

Contribuições são bem-vindas! Siga os passos abaixo:

1. Faça um fork do repositório.
2. Crie uma branch para sua feature (`git checkout -b feature/nova-feature`).
3. Commit suas mudanças (`git commit -m 'Adiciona nova feature'`).
4. Faça push para a branch (`git push origin feature/nova-feature`).
5. Abra um Pull Request.

---

## 📄 Licença

Este projeto está licenciado sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

---

Divirta-se jogando! 🎉
