deps:
    FROM elixir:latest
    COPY mix.exs .
    RUN mix local.rebar --force \
        && mix local.hex --force \
        && mix deps.get
    SAVE ARTIFACT mix.lock AS LOCAL mix.lock

update-deps:
    FROM elixir:latest
    COPY mix.exs .
    RUN mix local.rebar --force \
        && mix local.hex --force \
        && mix deps.update --all
    SAVE ARTIFACT mix.lock AS LOCAL mix.lock

build:
    FROM +deps
    COPY lib ./lib
    ENV MIX_ENV=prod
    RUN mix release
    SAVE ARTIFACT _build/prod AS LOCAL _build/prod
