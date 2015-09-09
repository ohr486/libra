defmodule Libra.Manager do
  require Logger

  use GenServer

  @default_name :libra

  defmodule State do
    defstruct pid: nil,
              host: nil,
              namespace: nil,
              stats: nil
  end

  def start_link(opts \\ []) do
    name = Keyword.get(opts, :name, @default_name)
    GenServer.start_link(__MODULE__, [opts], [{:name, name}])
  end

  # gen server callbacks

  def init([opts]) do
    name = Keyword.get(opts, :name, @default_name)
    {:ok, localhost} = :inet.gethostname()

    state = %State{
      pid: self(),
      host: to_string(localhost)
    }

    {:ok, state, 0}
  end

  def handle_call({:hoge, arg1, arg2}, from, state) do
    IO.puts "# handle_call #"
    IO.puts "hoge"
    IO.inspect arg1
    IO.inspect arg2
    {:reply, {:ok, from}, state}
  end

  def handle_call(_req, _from, state) do
    Logger.error("unkown call")
    {:reply, :unkown, state, 0}
  end

end
