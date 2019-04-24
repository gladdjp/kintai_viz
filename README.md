# KintaiViz

The sample application to demonstrate the code in Elixir and Phoenix.
KintaiViz listen to the webhook from our slack's Kintai channel and visualize
them in real time.

## Prerequisite
- Elixir (>=1.7)
- PostgreSQL
- Node

## Installation
1. Rename `.env.example` to `.env` then edit that file by adding your db username
and password. You can leave the database name as is.
2. Run `source .env` to load the system variable.
3. Run `mix deps.get`
4. Run `mix ecto.create`
5. Run `mix ecto.migrate`

## Up & Running
1. When you access the folder for the first time, run `source .env` to load the
environment variables.
2. Run `iex -S mix phx.server`. This will start the server at `localhost:4000`

