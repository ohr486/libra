defmodule Libra.ScanPlug do
  @moduledoc """
  """

  @behaviour Plug

  import Plug.Conn, only: [register_before_send: 2]
  alias Plug.Conn

  def init(opts), do: opts

  def call(conn, opts) do
    before_time = :os.timestamp()

    conn
    |> Conn.register_before_send(fn conn_x ->
      after_time = :os.timestamp()
      diff = :timer.now_diff(after_time, before_time)

      Libra.Histogram.add([:resp_time, conn_x.request_path], diff)
      Libra.Counter.inc([:resp_count, conn_x.request_path])
      Libra.Counter.inc([:total_resp_count])

      conn_x
    end)
  end
end

