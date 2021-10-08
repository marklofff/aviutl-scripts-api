defmodule AviutlScripts.Repo.Migrations.CreateScripts do
  use Ecto.Migration
  import Ecto.SoftDelete.Migration

  def change do
    create table(:scripts) do
      add :title, :text
      add :sub_title, :text
      add :thumb, :string
      add :source_code_url, :string
      add :download_url, :string
      add :author, references(:users, on_delete: :nothing)

      timestamps()
      soft_delete_columns()
    end

    create index(:scripts, [:author])
  end
end
