defmodule AviutlScriptsWeb.Schema do
  use Absinthe.Schema

  alias AviutlScriptsWeb.Resolvers
  alias AviutlScriptsWeb.Data

  import_types Absinthe.Type.Custom
  import_types AviutlScriptsWeb.Schema.Types
  import_types AbsintheErrorPayload.ValidationMessageTypes

  query do
    # put queries
    import_fields :script_queries
  end

  mutation do
    import_fields :user_mutations
    import_fields :script_mutations
    # import_fields :session_mutations
  end

  def context(ctx) do
    loader =
      Dataloader.new()
      |> Dataloader.add_source(Data, Data.data())

    Map.put(ctx, :loader, loader)
  end

  def plugins do
    [Absinthe.Middleware.Dataloader] ++ Absinthe.Plugin.defaults()
  end

  def middleware(middleware, _field, _object) do
    [] ++ middleware
  end
end

