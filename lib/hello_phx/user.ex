defmodule HelloPhx.User do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:id, :email]}
  @primary_key {:id, :binary_id, autogenerate: true}
  schema "users" do
    field :email, :string
    has_many :texts, HelloPhx.Text
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email])
    |> validate_required([:email])
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
  end
end
