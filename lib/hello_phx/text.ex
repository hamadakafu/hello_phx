defmodule HelloPhx.Text do
  use Ecto.Schema
  import Ecto.Changeset
  require Protocol

  @derive {Jason.Encoder, only: [:id, :value, :inserted_at, :user_id]}
  @primary_key {:id, :binary_id, autogenerate: true}
  schema "texts" do
    field :value, :string
    belongs_to :user, HelloPhx.User, type: :binary_id, primary_key: false
    timestamps(updated_at: false, type: :utc_datetime)
  end


  @doc false
  def changeset(text, attrs) do
    text
    |> cast(attrs, [:value, :user])
    |> validate_required([:value, :user])
    |> validate_length(:value, max: 1024)
  end
end
