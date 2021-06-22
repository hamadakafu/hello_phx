defmodule HelloPhxWeb.Router do
  use HelloPhxWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", HelloPhxWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/wow", PageController, :wow
    get "/wow/:message", PageController, :wow_message
  end

  # Other scopes may use custom stacks.
  scope "/api", HelloPhxWeb do
    pipe_through :api

    get "/", PageController, :api_index
    get "/hello", PageController, :api_hello
    get "/redirect", PageController, :api_redirect
    get "/json", PageController, :api_render_json
    resources "/users", UserController, except: [:index, :new, :edit, :update] do
      get "/texts/latest", TextController, :latest
      resources "/texts", TextController, except: [:index, :new, :edit, :update]
    end
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: HelloPhxWeb.Telemetry
    end
  end
end
