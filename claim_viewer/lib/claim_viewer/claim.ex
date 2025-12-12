defmodule ClaimViewer.Claims.Claim do
  use Ecto.Schema
  import Ecto.Changeset

  schema "claims" do
    field :raw_json, {:array, :map}

    timestamps()
  end

def changeset(claim, attrs) do
  claim
  |> cast(attrs, [:raw_json])
  |> validate_required([:raw_json])
end

end
