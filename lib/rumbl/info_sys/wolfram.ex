defmodule Rumbl.InfoSys.Wolfram do
  import SweetXml
  alias Rumbl.InfoSys.Result

  def start_link(query, query_ref, owner, limit) do
    # invoke this modules `fetch` function with an array of arguments
    Task.start_link(__MODULE__, :fetch, [query, query_ref, owner, limit])
  end

  def fetch(query_str, query_ref, owner, _limit) do
    query_str
    |> fetch_xml()
    |> xpath(~x"/queryresult/pod[contains(@title, 'Result') or
                                 contains(@title, 'Definitions')]
                            /subpod/plaintext/text()")
    |> send_results(query_ref, owner)
  end

  defp send_results(nil, query_ref, owner) do
    # send results back to the requester PID in owner.
    send(owner, {:results, query_ref, []})
  end
  defp send_results(answer, query_ref, owner) do
    results = [%Result{backend: "wolfram", score: 95, text: to_string(answer)}]
    # send results back to the requester PID in owner.
    send(owner, {:results, query_ref, results})
  end

  defp fetch_xml(query_str) do
    {:ok, {_, _, body}} = :httpc.request(
      String.to_char_list("http://api.wolframalpha.com/v2/query" <>
        "?appid=#{app_id()}" <>
        "&input=#{URI.encode(query_str)}" <>
        "&format=plaintext"))
    body
  end

  defp app_id, do: Application.get_env(:rumbl, :wolfram)[:app_id]
end
