defmodule AviutlScripts.ScriptManagerTest do
  use AviutlScripts.DataCase

  alias AviutlScripts.ScriptManager

  describe "scripts" do
    alias AviutlScripts.ScriptManager.Script

    import AviutlScripts.ScriptManagerFixtures

    @invalid_attrs %{download_url: nil, source_code_url: nil, sub_title: nil, thumb: nil, titie: nil}

    test "list_scripts/0 returns all scripts" do
      script = script_fixture()
      assert ScriptManager.list_scripts() == [script]
    end

    test "get_script!/1 returns the script with given id" do
      script = script_fixture()
      assert ScriptManager.get_script!(script.id) == script
    end

    test "create_script/1 with valid data creates a script" do
      valid_attrs = %{download_url: "some download_url", source_code_url: "some source_code_url", sub_title: "some sub_title", thumb: "some thumb", titie: "some titie"}

      assert {:ok, %Script{} = script} = ScriptManager.create_script(valid_attrs)
      assert script.download_url == "some download_url"
      assert script.source_code_url == "some source_code_url"
      assert script.sub_title == "some sub_title"
      assert script.thumb == "some thumb"
      assert script.titie == "some titie"
    end

    test "create_script/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ScriptManager.create_script(@invalid_attrs)
    end

    test "update_script/2 with valid data updates the script" do
      script = script_fixture()
      update_attrs = %{download_url: "some updated download_url", source_code_url: "some updated source_code_url", sub_title: "some updated sub_title", thumb: "some updated thumb", titie: "some updated titie"}

      assert {:ok, %Script{} = script} = ScriptManager.update_script(script, update_attrs)
      assert script.download_url == "some updated download_url"
      assert script.source_code_url == "some updated source_code_url"
      assert script.sub_title == "some updated sub_title"
      assert script.thumb == "some updated thumb"
      assert script.titie == "some updated titie"
    end

    test "update_script/2 with invalid data returns error changeset" do
      script = script_fixture()
      assert {:error, %Ecto.Changeset{}} = ScriptManager.update_script(script, @invalid_attrs)
      assert script == ScriptManager.get_script!(script.id)
    end

    test "delete_script/1 deletes the script" do
      script = script_fixture()
      assert {:ok, %Script{}} = ScriptManager.delete_script(script)
      assert_raise Ecto.NoResultsError, fn -> ScriptManager.get_script!(script.id) end
    end

    test "change_script/1 returns a script changeset" do
      script = script_fixture()
      assert %Ecto.Changeset{} = ScriptManager.change_script(script)
    end
  end
end
