defmodule AviutlScriptsWeb.Resolvers.Utils do
  import AbsintheErrorPayload.Payload

  def generate_payload(%Paginator.Page{} = payload) do
    {:ok, success_payload(payload)}
  end

  def generate_payload(payload) when is_list(payload) do
    {:ok, success_payload(payload)}
  end

  def generate_payload(payload) do
    case payload do
      {:ok, payload} ->
        {:ok, payload}
      {:error, %Ecto.Changeset{} = changeset} ->
        {:ok, changeset}
    end
  end
end

