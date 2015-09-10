defmodule Libra.Mixfile do
  use Mix.Project

  def project do
    [app: :libra,
     version: "0.0.1",
     elixir: "~> 1.0",
     elixirc_paths: ["lib", "web"],
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [
      mod: {Libra, []},
      applications: [:logger, :exometer]
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [
      {:plug, "~> 1.0"},
      {:cowboy, "~> 1.0"},
      {:exometer_core, github: "PSPDFKit-labs/exometer_core", override: true},
      {:exometer, github: "PSPDFKit-labs/exometer"},
      {:edown, github: "uwiger/edown", tag: "0.7", override: true},
    ]
  end
end
