defmodule HelloPhx.HttpCrawl do
  use GenServer

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

    basic_auth = Application.fetch_env!(:hello_phx, :basic_auth)
    config = Application.fetch_env!(:hello_phx, HelloPhx.HttpCrawl)

    HTTPoison.get!(
      config[:url],
      [],
      hackney: [basic_auth: {basic_auth[:username], basic_auth[:password]}]
    )

    {:noreply, state}
  end

  defp schedule_work() do
    # 10分毎に自分に:workをsendする
    Process.send_after(self(), :work, 10 * 60 * 1000)
  end
end
