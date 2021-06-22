defmodule HelloPhx.Repo.Migrations.ModifyTimestamps do
  use Ecto.Migration

  def change do
    alter table(:users) do
      modify :inserted_at, :utc_datetime
      modify :updated_at, :utc_datetime
    end
    alter table(:texts) do
      modify :inserted_at, :utc_datetime
    end
  end
end
