defmodule HelloPhxWeb.PageView do
  use HelloPhxWeb, :view

  def render("api.json", %{page: data}) do
    %{data: render_one(data, HelloPhxWeb.PageView, "page.json")}
  end

  # NOTE: page_view.exなので%{page: hoge}にしないといけない
  # NOTE: page_view.exなので%{fuga: hoge}だと/templates以下を探しに行く
  def render("page.json", %{page: data}) do
    %{message: data.message}
  end
end
