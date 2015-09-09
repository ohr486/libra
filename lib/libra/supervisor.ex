defmodule Libra.Supervisor do
  use Supervisor

  def start(opts \\ []) do
    Supervisor.start_link(__MODULE__, {opts}, name: :libra_sup)
  end

  def start_link(opts \\ []) do
    Supervisor.start_link(__MODULE__, {opts}, name: :libra_sup)
  end

  def init({opts}) do
    children = [worker(Libra.Manager, [opts])]
    supervise(children, strategy: :one_for_one, max_restarts: 500, max_second: 5)
  end
end
