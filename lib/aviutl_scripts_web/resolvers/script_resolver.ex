defmodule AviutlScriptsWeb.Resolvers.ScriptResolver do
  alias AviutlScripts.ScriptManager

  import AbsintheErrorPayload.Payload
  import AviutlScriptsWeb.Resolvers.Utils

  def paginate_scripts(_, cursor, _) do
    pages =
      cursor
      |> ScriptManager.paginate_scripts()

    {:ok, pages}
  end

  def show(_, params, _) do
    user = ScriptManager.get_script!(params)

    {:ok, user}
  end

  def create(_, %{params: params}, %{context: _context}) do
    # TODO
    params
    |> ScriptManager.create_script()
    |> generate_payload()
  end

  def create(_, %{params: params}, %{context: %{current_user: current_user}}) do
    # TODO
  end

  def update(_, %{id: id, params: params}, %{context: _context}) do
    script = ScriptManager.get_script!(id)

    script
    |> ScriptManager.update_script(params)
    |> generate_payload()
  end

  def update(_, %{id: id, params: params}, %{context: %{current_user: current_user}}) do
    # TODO
    script = ScriptManager.get_script!(id)

    script
    |> ScriptManager.update_script(params)
    |> generate_payload()
  end

  def delete(_, %{id: id}, %{context: _context}) do
    # TODO
    script = ScriptManager.get_script!(id)

    script
    |> ScriptManager.delete_script()
    |> generate_payload()
  end
end
