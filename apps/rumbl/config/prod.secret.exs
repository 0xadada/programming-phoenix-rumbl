use Mix.Config

# In this file, we keep production configuration that
# you'll likely want to automate and keep away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or yourself later on).
config :rumbl, RumblWeb.Endpoint,
  secret_key_base: "QW8UsDQYfatUZFhcoBpRjDF0gLC/NO5FIC+uh+nCTFeaMUjgSXDrpUd8SDnVfBel"
  :wolfram, app_id: "5K2L2V-J6X4HEWHR9"

# Configure your database
config :rumbl, Rumbl.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "rumbl_prod",
  pool_size: 15
