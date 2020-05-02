defmodule Core.Accounts.UserContext do
  alias Core.Repo
  alias Core.Accounts.User

  use EctoResource

  using_repo(Repo) do
    resource(User)
  end

  def get_user_by_email(email) do
    case Repo.get_by(User, email: email) do
      user when is_map(user) ->
        {:ok, user}

      nil ->
        {:error, "User not found"}
    end
  end
end
