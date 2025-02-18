defmodule TodoListManager do
  def main do
    todos = %{
      "1" => %{
        task: "Placeholder",
        complete: false
      }
    }

    IO.puts("WELCOME TO YOUR TODO LIST MANAGER")
    IO.puts("Options: 'view', 'q', 'add'")

    get_user_input(todos)
  end

  def get_user_input(todos) do
    action = IO.gets("What would you like to do?\n")

    case String.trim(action) do
      "view" ->
        view(todos)
        get_user_input(todos)

      "q" ->
        "Goodbye"

      "add" ->
        task = String.trim(IO.gets("What is the todo?\n"))

        id = :rand.uniform(100_000_000) |> Integer.to_string()

        todo = %{
          task: task,
          complete: false
        }

        todos = Map.put(todos, id, todo)

        get_user_input(todos)

      "complete" ->
        id = String.trim(IO.gets("What is the task id?\n"))

        todos =
          Map.update(todos, id, %{}, fn item ->
            %{item | complete: true}
          end)

        get_user_input(todos)

      "delete" ->
        id = String.trim(IO.gets("What is the task id?\n"))

        todos = Map.delete(todos, id)

        get_user_input(todos)

      _ ->
        IO.puts("Nahh")
        get_user_input(todos)
    end
  end

  def view(todos) do
    Enum.each(todos, fn {id, data} ->
      completed_text = if data.complete, do: "Complete", else: "NOT Complete"

      IO.puts("'#{data.task}' with ID #{id} id #{completed_text}\n")
    end)
  end
end
