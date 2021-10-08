defmodule AviutlScripts.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `AviutlScripts.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        name: "some name",
        password_hash: "some password_hash"
      })
      |> AviutlScripts.Accounts.create_user()

    user
  end
end
