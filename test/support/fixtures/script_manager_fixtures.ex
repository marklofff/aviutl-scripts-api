defmodule AviutlScripts.ScriptManagerFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `AviutlScripts.ScriptManager` context.
  """

  @doc """
  Generate a script.
  """
  def script_fixture(attrs \\ %{}) do
    {:ok, script} =
      attrs
      |> Enum.into(%{
        download_url: "some download_url",
        source_code_url: "some source_code_url",
        sub_title: "some sub_title",
        thumb: "some thumb",
        titie: "some titie"
      })
      |> AviutlScripts.ScriptManager.create_script()

    script
  end
end
