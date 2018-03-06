defmodule Libra.MixProject do
  use Mix.Project

  def project do
    [
      app: :libra,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # for test
      {:credo, "~> 0.8.1", only: [:dev, :test]},
      {:dialyxir, "~> 0.5.1", only: :dev, runtime: false},
      {:excoveralls, "~> 0.7.0", only: :test},
      {:mix_test_watch, "~> 0.5.0", only: :dev, runtime: false}
    ]
  end
end
