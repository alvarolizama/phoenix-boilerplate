defmodule Core.Repo.Migrations.CreateAccountsUsers do
  use Ecto.Migration

  def change do
    create table(:accounts_users) do
      add :email, :string
      add :password, :string
      add :active, :boolean, default: false, null: false

      timestamps()
    end

    create index("accounts_users", [:email])
  end
end
