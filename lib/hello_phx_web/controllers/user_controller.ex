defmodule HelloPhxWeb.UserController do
  use HelloPhxWeb, :controller
  alias HelloPhx.{Repo, User}

  def show(conn, %{"id" => id} = params) do
    IO.puts("#{inspect(id)}")
    json(conn, params)
  end

  def create(conn, params) do
    IO.puts("#{inspect(params)}, #{inspect(params["email"])}")

    case Repo.insert(%User{email: params["email"]}) do
      {:ok, user} -> json(conn, user)
      {:error, _changeset} -> conn |> send_resp(400, "")
    end
  end

  def delete(conn, %{"id" => id}) do
    case Repo.delete(%User{id: id}) do
      {:ok, user} -> json(conn, user)
      {:error, _changeset} -> conn |> send_resp(400, "")
    end
  end
end
