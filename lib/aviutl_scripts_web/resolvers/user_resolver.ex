defmodule AviutlScriptsWeb.Resolvers.UserResolver do
  alias AviutlScripts.Accounts

  import AbsintheErrorPayload.Payload
  import AviutlScriptsWeb.Resolvers.Utils

  def update(_, %{id: id, user: params}, _) do
    user = Accounts.get_user!(id)

    case Accounts.update_user(user, params) do
      {:error, %Ecto.Changeset{} = changeset} -> 
        {:ok, changeset}
      {:ok, user} ->
        {:ok, user}
    end
  end
end

