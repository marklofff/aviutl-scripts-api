deps:
    FROM elixir:latest
    COPY mix.exs .
    COPY mix.lock .
    RUN mix local.rebar --force \
        && mix local.hex --force \
        && mix deps.get

build:
    FROM +deps
    COPY lib ./lib
    ENV MIX_ENV=prod
    RUN mix release
    SAVE ARTIFACT _build/prod AS LOCAL _build/prod
