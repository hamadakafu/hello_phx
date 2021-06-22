defmodule HelloPhxWeb.PageController do
  use HelloPhxWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def wow(conn, _params) do
    render(conn, "hoge.html")
  end

  def wow_message(conn, %{"message" => message} = params) do
    IO.puts("#{inspect(params)}")

    conn
    |> put_layout(false)
    # |> put_layout("another_layout.html")
    |> render("wow_message.html", message: message)
  end

  def api_index(conn, _params) do
    json(conn, %{hoge: 3})
  end

  def api_hello(conn, _params) do
    json(conn, %{hellow: "world"})
  end

  def api_redirect(conn, _params) do
    redirect(conn, to: "/api/hello")
  end

  def api_render_json(conn, _params) do
    data = %{message: "hello"}
    render(conn, "api.json", page: data)
  end
end

