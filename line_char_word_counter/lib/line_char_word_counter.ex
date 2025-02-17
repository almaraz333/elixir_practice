defmodule LineCharWordCounter do
  def readFile do
    case File.read("./lib/text.txt") do
      {:ok, text} ->
        String.trim(text)

      {:error, reason} ->
        IO.inspect(reason, label: "Error reading file")
    end
  end

  def main do
    lines =
      LineCharWordCounter.readFile()
      |> String.split("\n")

    counts =
      count_words(lines, %{
        words: 0,
        chars: 0
      })

    IO.puts("#{length(lines)} Lines. \n #{counts.words} Words. \n #{counts.chars} Characters.")
  end

  def count_words([curr | rest], prev_value) do
    word_count =
      String.split(curr, " ", trim: true)
      |> length()

    char_count =
      String.split(curr, "", trim: true)
      |> length()

    new_counts = %{
      words: prev_value.words + word_count,
      chars: prev_value.chars + char_count
    }

    count_words(rest, new_counts)
  end

  def count_words([], prev_value) do
    prev_value
  end
end
