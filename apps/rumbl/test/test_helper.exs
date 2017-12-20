Code.require_file "../../info_sys/test/backends/http_client.exs", __DIR__
ExUnit.start()

Ecto.Adapters.SQL.Sandbox.mode(Rumbl.Repo, :manual)
# Mix.Task.run "ecto.create", ~w(-r Rumbl.Repo --quiet)
# Mix.Task.run "ecto.migrate", ~w(-r Rumbl.Repo --quiet)
