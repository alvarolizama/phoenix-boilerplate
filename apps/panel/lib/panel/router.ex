defmodule Panel.Router do
  use Panel, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {Panel.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :auth do
    plug Panel.AuthPlug
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/auth", Panel do
    pipe_through :browser

    get "/", AuthController, :index
    post "/login", AuthController, :auth
    get "/logout", AuthController, :logout
  end

  scope "/", Panel do
    pipe_through [:browser, :auth]

    live "/", DashboardLive
    live "/example", ExampleMainLive
  end

  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/phx" do
      pipe_through :browser
      live_dashboard "/", metrics: Panel.Telemetry
    end
  end
end
