defmodule AviutlScripts.Repo.Migrations.UpdateScripts do
  use Ecto.Migration

  def change do
    alter table("scripts") do
      add :tag, :text
      add :category, :text
    end
  end
end
