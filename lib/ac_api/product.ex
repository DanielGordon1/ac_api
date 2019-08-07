defmodule AcApi.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :price, :integer, default: 0
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:title, :price])
    |> validate_required([:title, :price])
    |> validate_length(:title, min: 3)
  end
end
