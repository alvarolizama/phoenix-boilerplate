defmodule Panel.DashboardLive do
  use Panel, :live_view

  @impl true
  def mount(_params, session, socket) do
    {:ok,
     assign(socket,
       module: "dashboard",
       page_title: "Dashboard",
       user: session["user"].email
     )}
  end
end
