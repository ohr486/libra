defmodule Mix.Tasks.Libra.Scholar do
  use Mix.Task

  @shortdoc "Start the Schalar[Monitoring Server]"

  def run(args) do
    Plug.Adapters.Cowboy.http Libra.RouterPlug, [namespace: ""], port: 8081
    :timer.sleep(:infinity)
  end
end
