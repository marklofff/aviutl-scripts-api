defmodule AviutlScriptsWeb.Schema.Types do
  @moduledoc false
  use Absinthe.Schema.Notation

  alias AviutlScriptsWeb.Schema.{
    UserType,
    PaginationType,
    ScriptType,
    # SessionType,
  }

  import_types PaginationType
  import_types UserType
  import_types ScriptType
  # import_types SessionType
end
