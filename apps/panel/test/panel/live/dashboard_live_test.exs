defmodule Panel.DashboardLiveTest do
  use Panel.ConnCase

  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, dasboard_live, disconnected_html} = live(conn, "/")
    assert disconnected_html =~ "Dasboard content"
    assert render(page_live) =~ "Dasboard content"
  end
end
