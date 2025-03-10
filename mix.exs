defmodule DesafioDosTres.MixProject do
  use Mix.Project

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
end
