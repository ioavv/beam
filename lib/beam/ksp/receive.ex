defmodule Receive do
  def start1 do
    receive do
      {:selector, number, name} when is_integer(number) ->
        name
      name when is_atom(name) ->
        name
      _ ->
        IO.puts(:stderr, "Unexpected message received")
    end
  end

  def start2 do
    receive do
      {:selector, number, name} when is_integer(number) ->
        name
      name when is_atom(name) ->
        name
      _ ->
        IO.puts(:stderr, "Unexpected Message Received")
    after
      5000 ->
        IO.puts(:stderr, "No message in 5 seconds")
    end
  end
end
