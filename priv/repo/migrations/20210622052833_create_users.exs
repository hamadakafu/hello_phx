defmodule HelloPhx.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :uuid, primary_key: true, null: false
      add :email, :text

      timestamps()
    end
    create index(:users, [:email], unique: true)

  end
end
