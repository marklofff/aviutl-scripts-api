defmodule AviutlScriptsWeb.Schema.PaginationType do
  @moduledoc false
  use Absinthe.Schema.Notation

  object :metadata do
    field :after, :string
    field :before, :string
    field :limit, :integer
    field :total_count, :integer
    field :total_count_cap_exceeded, :boolean
  end
end
