defmodule Libra.RouterPlug do
  require Logger
  require EEx

  alias Libra.RouterPlug.Router

  def init(opts) do
  end

  def call(conn, opts) do
    Router.call(conn, Router.init(opts))
  end

  defmodule Router do
    import Plug.Conn
    use Plug.Router

    plug Plug.Static, at: "/", from: :libra
    plug Libra.ScanPlug

    plug :match
    plug :dispatch

    index_path = Path.join([Application.app_dir(:libra), "priv/static/index.html"])
    EEx.function_from_file :defp, :render_index, index_path, [:assigns]

    get "/unko" do
      conn
      |> send_resp(200, "unko")
      |> halt
    end

    match _ do
      conn
      |> put_resp_header("content-type", "text/html")
      |> send_resp(200, render_index(base: ""))
      |> halt
    end
  end
end
