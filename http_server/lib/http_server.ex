defmodule HttpServer do
  def get() do
    case HTTPoison.get!("https://jsonplaceholder.typicode.com/todos/1") do
      %HTTPoison.Response{status_code: 200, body: body} ->
        Poison.decode!(body)
    end
  end

  def post() do
    # HTTPoison.post(
    #        "https://jsonplaceholder.typicode.com/posts",
    #        "{\"title\": \"foo\",\"body\": \"bar\",\"userId\": \"1\"}",
    #        [{"Content-Type", "application/json; charset=UTF-8"}]
    #      )
    case HTTPoison.post(
           "https://jsonplaceholder.typicode.com/posts",
           "{\"title\": \"foo\",\"body\": \"bar\",\"userId\": \"1\"}",
           [{"Content-Type", "application/json; charset=UTF-8"}]
         ) do
      {:ok, %HTTPoison.Response{status_code: 201, body: body}} ->
        Poison.decode!(body)
        # |> Map.get("body")
    end
  end
end
