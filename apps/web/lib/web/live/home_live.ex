defmodule Web.HomeLive do
  use Web, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     assign(socket,
       module: "home",
       page_title: "Home"
     )}
  end
end
