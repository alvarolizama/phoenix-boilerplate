defmodule Web.HomeLiveTest do
  use Web.ConnCase

  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, home_live, disconnected_html} = live(conn, "/")
    assert disconnected_html =~ "Home"
    assert render(home_live) =~ "Home"
  end
end
