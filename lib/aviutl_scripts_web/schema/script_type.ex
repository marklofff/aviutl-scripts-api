defmodule AviutlScriptsWeb.Schema.ScriptType do
  @moduledoc false
  use Absinthe.Schema.Notation

  import Absinthe.Resolution.Helpers, only: [dataloader: 1, dataloader: 2, dataloader: 3]
  import AbsintheErrorPayload.Payload

  alias AviutlScriptsWeb.Data
  alias AviutlScriptsWeb.Resolvers
  alias AviutlScriptsWeb.Middlewares.Authentication

  object :script_type do
    field :id, :id
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
    field :deleted_at, :naive_datetime

    field :title, :string
    field :sub_title, :string
    field :tumb, :string
    field :uuid, :string

    # leader
    field :author, :user_type, name: "author",
      resolve: dataloader(Data)
  end

  object :script_pagination do
    field :metadata, :metadata
    field :entries, list_of(:script_type)
  end

  payload_object(:script_payload, :script_type)
  payload_object(:script_pagination_payload, :script_pagination)

  input_object :script_input do
    field :title, :string
    field :sub_title, :string
    field :tumb, :string
  end

  input_object :script_update_input do
    field :title, :string
    field :sub_title, :string
    field :tumb, :string
  end

  object :script_queries do
    @desc "Get a list of all scripts"
    field :scripts, :script_pagination do
      arg :after, :string
      arg :before, :string
      resolve &Resolvers.ScriptResolver.list/3
    end

    @desc "Get a specific script"
    field :script, :script_type do
      arg :id, :id
      arg :uuid, :string
      arg :unique_name, :string
      resolve &Resolvers.ScriptResolver.show/3
    end
  end

  object :script_mutations do
    @desc "Update a script"
    field :update_script, type: :script_payload do
      arg :id, non_null(:integer)
      arg :params, :script_update_input

      middleware Authentication
      resolve &Resolvers.ScriptResolver.update/3
      middleware &build_payload/2
    end

    @desc "create new script"
    field :create_script, type: :script_payload do
      arg :params, :script_input

      middleware Authentication
      resolve &Resolvers.ScriptResolver.create/3
      middleware &build_payload/2
    end
  end
end
