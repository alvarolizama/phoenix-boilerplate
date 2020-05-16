defmodule Panel.DashboardLiveTest do
  use Panel.ConnCase

  import Phoenix.LiveViewTest

  @tag :auth
  test "disconnected and connected render", %{conn: conn} do
    conn = auth_session(conn)
    {:ok, dashboard_live, disconnected_html} = live(conn, "/")
    assert disconnected_html =~ "Dashboard"
    assert render(dashboard_live) =~ "Dashboard"
  end
end
