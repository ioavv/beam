defmodule Example_En do
  def start do
    Enum.map([2, 4, 6], fn x -> x * 5 end)
  end

  def start1 do
    Enum.sum([2,3,4,5])
  end

  def start2 do
    map = %{"a" => 1, "b" => 2}
    Enum.map(map, fn {k, v} -> {k, v * 2} end)
  end

  def start3 do
    Enum.all?([1, 3, 5, 7, nil, 9])
  end

  def start4 do
    Enum.any?([2, 3, 4], fn x -> rem(x, 2) == 1 end)
  end

  def start5 do
    Enum.at([2, 4, 6], 2)
  end

  def start6 do
    Enum.chunk_by([1, 2, 2, 3, 4, 5, 6, 5, 6, 6, 7], &(rem(&1, 2) == 1))
  end

  def start7 do
    chunk_fun = fn element, acc ->
      if rem(element, 2) == 0 do
        {:cont, Enum.reverse([element | acc]), []}
      else
        {:cont, [element | acc]}
      end
    end

    after_fun = fn
      [] -> {:cont, []}
      acc -> {:cont, Enum.reverse(acc), []}
    end

  Enum.chunk_while(1..30, [], chunk_fun, after_fun)
  end

  def start8 do
    Enum.concat(1..3, 4..6, 7..9)
  end

  def start9 do
    Enum.count_until(1..10, 10 + 1) == 10
  end

  def start10 do
    Enum.count_until(1..30, fn x -> rem(x, 2) == 0 end, 11)
  end

  def start11 do
    Enum.dedup([1, 1, 2, 3, 3, 4, 3, 2, 1])
  end

  def start12 do
    Enum.dedup_by([{1, :a}, {2, :b}, {2, :c}, {1, :a}], fn {x, _} -> x end)
  end

  def start13 do
    Enum.drop_every(1..30, 3)
  end

  def start14 do
    Enum.drop_while(1..20, fn x -> x > 12 end)
  end

  def start15 do
    Enum.each(["some", "example"], fn x -> IO.puts(x) end)
  end

  def start16 do
    strings = ["1234", "abc", "12ab"]

    Enum.flat_map(strings, fn string ->
      case Integer.parse(string) do
        {int, _rest} -> [int]

        :error -> []
      end
    end)
  end

  def start17 do
    Enum.find([2, 3, 4], fn x -> rem(x, 2) == 1 end)
  end

  def start18 do
    Enum.find_value([2, 3, 4, 5], fn x ->
      if x > 2, do: x * x
    end)
  end

  def start19 do
    Enum.flat_map([{1, 3}, {4, 6}], fn {x, y} -> x..y end)
  end

  def start20 do
    enumerable = 1..100
    n = 3
    Enum.flat_map_reduce(enumerable, 0, fn x, acc ->
      if acc < n, do: {[x], acc + 1}, else: {:halt, acc}
    end)
  end

  def start21 do
    Enum.frequencies_by(~w{aaa aA bbb cc c}, &String.length/1)
  end

  def start22 do
    Enum.group_by(~w{ant buffalo cat dingo}, &String.length/1, &String.first/1)
  end

  def start23 do
    Enum.intersperse([1, 2, 3, 4, 5, 6, 7, 8], 2)
  end

  def start24 do
    Enum.into(%{a: 1}, %{b: 2})
  end

  def start25 do
    Enum.join([1, 2, 3, 4], " = ")
  end

  def start26 do
    Enum.map_every([1, 2, 3], 1, fn x -> x + 1000 end)
  end

  def start27 do
    Enum.map_intersperse([1, 2, 3], :a, &(&1 * 2))
  end

  def start28 do
    Enum.map_join([1, 2, 3, 4], " = ", &(&1 * 2))
  end
end
