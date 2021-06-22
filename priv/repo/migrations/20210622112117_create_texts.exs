defmodule HelloPhx.Repo.Migrations.CreateTexts do
  use Ecto.Migration

  def change do
    create table(:texts, primary_key: false) do
      add :id, :uuid, primary_key: true, null: false
      add :value, :string, size: 1024, null: false
      add :user_id, references(:users, on_delete: :delete_all, type: :uuid), null: false
      timestamps(updated_at: false)
    end

  end
end
