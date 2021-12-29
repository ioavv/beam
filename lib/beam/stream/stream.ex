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

  def start17 do
    stream = Stream.flat_map([1, 2, 3, 4], fn x -> [x, x * 5] end)
    Enum.to_lust(stream)
  end

  def start18 do
    stream = Stream.flat_map([1, 2, 3], fn x -> [[x]] end)
    Enum.to_list(stream)
  end

  def start19 do
    stream = Stream.intersperse([1, 2, 3, 4], 33) |> Enum.to_list()
  end

  def start20 do
    Stream.interval(20) |> Enum.take(15)
  end

  def start21 do
    Stream.iterate(3, &(&1 * 44)) |> Enum.take(7)
  end

  def start22 do
    stream = Stream.map([1, 2, 3], fn x -> x * 23 end)
    Enum.to_list(stream)
  end

  def start23 do
    stream = Stream.map_every(1..30, 2, fn x -> x * 4 end)
    Enum.to_list(stream)
  end

  def start24 do
    stream = Stream.reject([1, 2, 3], fn x -> rem(x, 2) == 0 end)
    Enum.to_list(stream)
  end

  def start25 do
    :rand.seed(:exsss, {1, 2, 3})
    Stream.repeatedly(&:rand.uniform/0) |> Enum.take(3)
  end

  def start26 do
    Stream.resource(
      fn ->
        {:ok, pid} = StringIO.open("string")
        pid
      end,
      fn pid ->
        case IO.getn(pid, "", 1) do
          :eof -> {:halt, pid}
          char -> {[char], pid}
        end
      end,
      fn pid -> StringIO.close(pid) end
    ) |> Enum.to_list()
  end

  def start27 do
    stream = Stream.scan(1..10, &(&1 + &2))
    Enum.to_list(stream)
  end

  def start28 do
    stream = Stream.scan(1..10, 0, &(&1 + &2))
    Enum.to_list(stream)
  end

  def start29 do
    stream = Stream.take(1..100, 5)
    Enum.to_list(stream)
  end

  def start30 do
    stream = Stream.take_every(1..40, 3)
    Enum.to_list(stream)
  end

  def start31 do
    stream = Stream.take_while(1..100, &(&1 <= 50))
    Enum.to_list(stream)
  end

  def start32 do
    Stream.timer(10) |> Enum.to_list()
  end

  def start33 do
    enum = 1001..9999
    n = 3
    stream = Stream.transform(enum, 0, fn i, acc ->
      if acc < n, do: {[i], acc + 1}, else: {:halt, acc}
    end)

    Enum.to_list(stream)
  end

  def start34 do
    Stream.unfold(5, fn
      0 -> nil
      n -> {n, n - 1}
    end) |> Enum.to_list()
  end

  def start35 do
    Stream.uniq([1, 2, 2, 3, 3, 3, 4, 5, 5]) |> Enum.to_list()
  end

  def start36 do
    Stream.uniq_by([a: {:tea, 2}, b: {:tea, 2}, c: {:coffee, 1}], fn {_, y} -> y end) |> Enum.to_list()
  end

  def start37 do
    stream = Stream.with_index([1, 2, 3, 4, 5], 3)
    Enum.to_list(stream)
  end

  def start38 do
    concat = Stream.concat(1..3, 4..6)
    cycle = Stream.cycle(["foo", "bar", "baz"])
    Stream.zip([concat, [:a, :b, :c], cycle]) |> Enum.to_list()
  end
end
