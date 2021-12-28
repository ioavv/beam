defmodule Example_Str do
  def start do
    range = 1..10
    stream = Stream.map(range, &(&1 * 5))
    Enum.map(stream, &(&1 + 4))
  end

  def start2 do
    stream = 1..10
    |> Stream.map(&IO.inspect(&1))
    |> Stream.map(&(&1 * 3))
    |> Stream.map(&IO.inspect(&1))
    Enum.to_list(stream)
  end

  def start3 do
    stream = Stream.chunk_by([1, 2, 2, 3, 4, 4, 4, 5, 6, 7], &(rem(&1, 2) == 1))
    Enum.to_list(stream)
  end

  def start4 do
    Stream.chunk_every([1, 2, 3, 4, 5, 6], 2) |> Enum.to_list()
  end

  def start5 do
    Stream.chunk_every([1, 2, 3, 4, 5], 3, 2, [5]) |> Enum.to_list()
  end

  def start6 do
    chunk_fun = fn element, acc ->
      if rem(element, 2) == 0 do
        {:cont, Enum.reverse([element | acc]), []}
      else
        {:cont, [element | acc]}
      end
    end

    after_fun = fn
      [] -> {:cont, []}
      acc -> {:cont, Enum.reverse(acc, [])}
    end

    stream = Stream.chunk_while(1..10, [], chunk_fun, after_fun)
    Enum.to_list(stream)
  end

  def start7 do
    stream = Stream.concat([1..3, 4..6, 7..9])

    Enum.to_list(stream)
  end

  def start8 do
    stream1 = Stream.cycle([1, 2, 3])
    stream2 = Stream.cycle([4, 5, 6])
    stream = Stream.concat(stream1, stream2)
    Enum.to_list(stream)
  end

  def start9 do
    stream = Stream.cycle([1, 2, 232])
    Enum.take(stream, 15)
  end

  def start10 do
    Stream.dedup([1, 2, 3, 3, 2, 1]) |> Enum.to_list()
  end

  def start11 do
    Stream.dedup_by([{1, :x}, {2, :y}, {2, :z}, {1, :x}], fn {x, _} -> x end) |> Enum.to_list()
  end

  def start12 do
    stream = Stream.drop(1..30, 3)
    Enum.to_list(stream)
  end

  def start13 do
    stream = Stream.drop_every([1, 2, 3, 4, 5], 2)
    Enum.to_list(stream)
  end

  def start14 do
    stream = Stream.drop_while(1..40, &(&1 <= 32))
    Enum.to_list(stream)
  end

  def start15 do
    stream = Stream.duplicate("Elixir", 8)
    Enum.to_list(stream)
  end

  def start16 do
    stream = Stream.each([1, 2, 3, 4], fn x -> send(self(), x) end)
    Enum.to_list(stream)
    receive do
      x when is_integer(x) -> x
    end
  end
end
