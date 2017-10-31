defmodule RumblWeb.UserController do
  use RumblWeb, :controller
  alias Rumbl.User

  def index(conn, _params) do
    users = Rumbl.Repo.all(User)
    render(conn, "index.html", users: users)
  end

  def show(conn, %{"id" => id}) do
    user = Rumbl.Repo.get(User, id)
    render(conn, "show.html", user: user)
  end

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)
    {:ok, user} = Rumbl.Repo.insert(changeset)

    conn
    |> put_flash(:info, "#{user.name} created!")
    |> redirect(to: user_path(conn, :index))
  end
end
