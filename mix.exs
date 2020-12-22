defmodule Issue116.MixProject do
  use Mix.Project

  def project do
    [
      app: :issue116,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:jason, "~> 1.2"},
      {:finch, "~> 0.6.0"},
      {:bypass, "~> 2.1", only: :test}
    ]
  end
end
