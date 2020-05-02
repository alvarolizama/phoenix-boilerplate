defmodule Core.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "accounts_users" do
    field :active, :boolean, default: false
    field :email, :string
    field :password, Comeonin.Ecto.Password

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :password, :active])
    |> validate_required([:email, :active])
  end
end
