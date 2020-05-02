defmodule Panel.ExampleMainLive do
  use Panel, :live_view

  @impl true
  def mount(_params, session, socket) do
    {:ok,
     assign(socket,
       module: "example",
       page_title: "Example Main",
       user: session["user"].email
     )}
  end
end
