defmodule HelloPhx.TextCrawl do
  use GenServer
  alias HelloPhx.{Repo, User, Text}
  import Ecto.Query, only: [from: 2]

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, %{})
  end

  def init(state) do
    schedule_work()
    {:ok, state}
  end

  # workをhandleする
  def handle_info(:work, state) do
    schedule_work()

    {a, b} = from(t in Text,
      where: datetime_add(^NaiveDateTime.utc_now(), -12, "hour") > t.inserted_at,
      select: t.id)
    |> Repo.delete_all()

    IO.puts("#{inspect({a, b})}")

    {:noreply, state}
  end

  defp schedule_work() do
    # 一時間毎に自分に:workをsendする
    Process.send_after(self(), :work, 60 * 60 * 1000)
  end
end
