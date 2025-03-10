# DesafioDosTres

DesafioDosTres é um jogo de estratégia para 3 jogadores, inspirado no clássico Jogo da Velha, mas com regras adicionais e um tabuleiro 4x4. Cada jogador possui um símbolo único e o objetivo é alinhar 4 símbolos consecutivos (horizontal, vertical ou diagonal) para vencer a partida.

## 📚 Objetivos do Projeto

- Proporcionar uma experiência divertida e desafiadora para 3 jogadores.
- Explorar e aplicar conceitos de programação funcional com Elixir.
- Implementar estratégias avançadas com regras como: 
  - Proibição de apagar o próprio símbolo em turnos consecutivos.
  - Regra contra vingança: não permitir a substituição imediata do símbolo de outro jogador após sua jogada.

## ⚙️ Como Jogar

- O jogo é disputado num tabuleiro de 4x4.
- Em cada turno, o jogador insere as coordenadas (linha e coluna) onde deseja colocar ou substituir um símbolo.
- As jogadas devem obedecer às regras especiais do jogo para que a jogada seja válida.
- Vence o primeiro jogador que alinhar 4 símbolos consecutivos; em caso de tabuleiro cheio sem vencedores, ocorre empate.

## 🚀 Instalação e Execução

### Pré-requisitos
- [Elixir](https://elixir-lang.org/install.html) instalado.

### Passos para Instalação
1. Clone o repositório:
   ```bash
   git clone https://github.com/Thiagoff-IT/desafio-dos-tres.git
   cd desafio-dos-tres
   ```

2. Execute o jogo:
   ```bash
   mix run run_game.ex
   ```

## 🛠️ Estrutura do Projeto

- `mix.exs`: Configuração do projeto Elixir.
- `lib/desafio_dos_tres.ex`: Contém a lógica principal do jogo.
- `run_game.ex`: Script para iniciar o jogo.
- `README.md`: Este arquivo, com informações e instruções.
- `test/`: Testes automatizados para validar a implementação.

## 🔍 Descrição das Funções do Game

- **inicializar_tabuleiro/0:** Cria e retorna um tabuleiro 4x4 vazio para iniciar o jogo.
- **jogar/5:** Gerencia o loop principal do jogo, alternando os turnos entre os jogadores e processando as entradas para cada jogada.
- **vencedor?/2:** Verifica se um jogador conseguiu alinhar 4 símbolos consecutivos (horizontal, vertical ou diagonal) para determinar o vencedor.
- **realizar_jogada/5:** Processa e valida a jogada do jogador, assegurando que as regras especiais (como a proibição de apagar em turnos consecutivos e a regra contra a vingança) sejam respeitadas.

## 🤝 Contribuições

Contribuições são bem-vindas! Para colaborar:
1. Faça um fork do repositório.
2. Crie uma branch para sua feature (`git checkout -b feature/nova-feature`).
3. Commit suas alterações (`git commit -m 'Adiciona nova feature'`).
4. Abra um Pull Request.

## 🎥 Vídeo do Jogo

<iframe width="640" height="360" src="https://www.youtube.com/embed/Oy9uWhb4GD8" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## 📄 Licença

Este projeto está licenciado sob a licença MIT.

