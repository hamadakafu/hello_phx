defmodule HelloPhxWeb.TextController do
  use HelloPhxWeb, :controller
  alias HelloPhx.{Repo, Text}
  import Ecto.Query, only: [from: 2]

  def show(conn, %{"id" => id, "user_id" => user_id}) do
    IO.puts("#{inspect(id)}")
    text = Repo.get_by!(Text, id: id, user_id: user_id)
    json(conn, text)
  end

  def create(conn, %{"user_id" => user_id, "value" => value}) do
    case Repo.insert(%Text{value: value, user_id: user_id}) do
      {:ok, text} ->
        json(conn, text)

      {:error, _changeset} ->
        conn |> send_resp(400, "")
    end

    conn
  end

  def delete(conn, %{"id" => id}) do
    case Repo.delete(%Text{id: id}) do
      {:ok, text} -> json(conn, text)
      {:error, _changeset} -> conn |> send_resp(400, "")
    end
  end

  def latest(conn, %{"user_id" => user_id}) do
    [text] =
      Repo.all(
        from(t in Text,
          where: t.user_id == ^user_id,
          order_by: [desc: :inserted_at],
          limit: 1
        )
      )

    conn |> json(text)
  end
end
