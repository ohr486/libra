defmodule Libra.ScanPlug do
  @moduledoc """
  """

  @behaviour Plug
  @allowed_methods ~w(GET HEAD)

  import Plug.Conn
  alias Plug.Conn

  def init(opts) do
  end

  def call(conn, opts) do
    before_time = :os.timestamp()

    conn
    |> Conn.register_before_send(fn conn_x ->
      after_time = :os.timestamp()
      diff = :timer.now_diff(after_time, before_time)

      IO.puts "----------------"
      IO.inspect conn_x.method
      IO.inspect conn_x.request_path
      IO.inspect conn_x.status
      IO.inspect diff
      IO.puts "----------------"

      conn_x
    end)
  end
end

