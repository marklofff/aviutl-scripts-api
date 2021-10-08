defmodule AviutlScripts.Repo do
  use Ecto.Repo,
    otp_app: :aviutl_scripts,
    adapter: Ecto.Adapters.Postgres

  use Paginator, include_total_count: true
  use Ecto.SoftDelete.Repo
end
