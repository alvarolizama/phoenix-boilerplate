defmodule Core.Helpers.UserHelper do
  alias Core.Accounts.UserContext

  def is_password_valid(email, password) do
    case UserContext.get_user_by_email(email) do
      {:ok, user} ->
        if Comeonin.Ecto.Password.valid?(password, user.password) do
          {:ok, user}
        else
          {:error, "Incorrect password"}
        end

      {:error, message} ->
        {:error, message}
    end
  end
end
