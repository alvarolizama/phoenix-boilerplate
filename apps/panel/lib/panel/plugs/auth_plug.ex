defmodule Panel.AuthPlug do
  import Plug.Conn

  def init(default), do: default

  def call(conn, _default) do
    user = get_session(conn, :user)

    if user == nil do
      conn
      |> Phoenix.Controller.put_flash(:error, "Login first to get access")
      |> Phoenix.Controller.redirect(to: "/auth/")
      |> halt()
    else
      if user.active do
        conn
      else
        conn
        |> Phoenix.Controller.put_flash(:error, "Your user is not active")
        |> Phoenix.Controller.redirect(to: "/auth/")
        |> halt()
      end
    end
  end
end
