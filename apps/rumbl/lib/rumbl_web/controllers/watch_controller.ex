defmodule RumblWeb.WatchController do
  use RumblWeb, :controller
  alias Rumbl.Medias

  def show(conn, %{"id" => id}) do
    video = Medias.get_video_by_id!(id)
    render(conn, "show.html", video: video)
  end
end
