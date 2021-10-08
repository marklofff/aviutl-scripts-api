defmodule AviutlScripts.ScriptManager.Script do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.SoftDelete.Schema

  schema "scripts" do
    field :download_url, :string
    field :source_code_url, :string
    field :sub_title, :string
    field :thumb, :string
    field :title, :string
    field :author, :id

    timestamps()
    soft_delete_schema()
  end

  @doc false
  def changeset(script, attrs) do
    script
    |> cast(attrs, [:title, :sub_title, :thumb, :source_code_url, :download_url])
    |> validate_required([:title, :sub_title, :source_code_url, :download_url])
  end
end
