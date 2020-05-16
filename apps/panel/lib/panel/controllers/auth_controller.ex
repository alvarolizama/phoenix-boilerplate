defmodule Panel.AuthController do
  use Panel, :controller

  alias Core.Accounts.UserHelper

  def index(conn, _params) do
    if get_session(conn, :user) do
      conn
      |> redirect(to: "/")
    end

    render(conn, "index.html", title: "Login")
  end

  def auth(conn, %{"auth" => auth}) do
    case UserHelper.is_password_valid(auth["email"], auth["password"]) do
      {:error, message} ->
        conn
        |> put_flash(:error, message)
        |> redirect(to: "/auth/")

      {:ok, user} ->
        conn
        |> put_session(:user, user)
        |> redirect(to: "/")
    end
  end

  def logout(conn, _params) do
    conn
    |> clear_session
    |> redirect(to: "/auth/")
  end
end
