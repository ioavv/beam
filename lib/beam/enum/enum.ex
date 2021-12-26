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

  def start29 do
    Enum.map_reduce([1, 2, 3,4], 0, fn x, acc -> {x * 2, x + acc} end)
  end

  def start30 do
    Enum.max([~D[2017-03-31], ~D[2017-04-01]], Date)
  end

  def start31 do
    Enum.max_by(["a", "aa", "aaa"], fn x -> String.length(x) end)
  end

  def start32 do
    users = [
      %{name: "Elis", birthday: ~D[1943-05-11]},
      %{name: "Jose", birthday: ~D[1990-03-02]},
      %{name: "Liam", birthdat: ~D[2000-11-11]}
    ]

    Enum.max_by(users, &(&1.birthday), Date)
  end

  def start33 do
    Enum.member?([1.0, 2.0, 3.0], 2.000)
  end

  def start34 do
    Enum.min_max_by(["a", "aaaa", "bbb", "dddddd", "ff"], &String.length/1)
    Enum.min_max_by(["a", "aaaa", "bbb", "dddddd", "ff"], fn x -> String.length(x) end)
  end

  def start35 do
    Enum.product([2.0, 3.0, 4.0])
  end

  def start36 do
    Enum.reduce([1, 2, 3, 4], fn x, acc -> x * acc end)
  end

  def start37 do
    Enum.reduce_while(1..200, 0, fn x, acc ->
      if x < 5, do: {:cont, acc + x}, else: {:halt, acc}
    end)
  end

  def start38 do
    Enum.reject([1, 2, 3, 4], fn x -> rem(x, 2) == 0 end)
  end

  def start39 do
    Enum.reverse([5, 4, 3, 2, 1])
  end

  def start40 do
    Enum.reverse_slice([2, 3, 4, 5, 6, 7, 7], 2, 4)
  end

  def start41 do
    Enum.scan(1..10, &(&1 + &2))
  end

  def start42 do
    Enum.scan(1..10, 0, &(&1 + &2))
  end

  def start43 do
    Enum.slice(1..30, -5..2)
  end

  def start44 do
    Enum.slide([:a, :b, :c, :d, :e, :f, :g], 5, 1)
    Enum.slide([:a, :b, :c, :d, :e, :f, :g], 3..-1//1, 2)
    Enum.slide([:a, :b, :c, :d, :e, :f, :g], 3, -1)
  end

  def start45 do
    Enum.sort([1, 2, 3, 4, 5], &(&1 >= &2))
    Enum.sort(["some", "kind", "of", "monster"], &(byte_size(&1) <= byte_size(&2)))
    Enum.sort(["some", "kind", "of", "monster"], &(byte_size(&1) < byte_size(&2)))
  end

  def start46 do
    dates = [~D[2019-01-01], ~D[2020-03-02], ~D[2019-06-06]]
    Enum.sort(dates)
  end

  def start47 do
    dates = [~D[2019-01-01], ~D[2020-03-02], ~D[2019-06-06]]
    Enum.sort(dates, {:asc, Date})
  end

  def start48 do
    Enum.sort_by(["some", "kind", "of", "monster"], &{byte_size(&1), String.first(&1)})
  end

  def start49 do
    users = [
      %{name: "Ellis", birthday: ~D[1943-05-11]},
      %{name: "Lovalece", birthday: ~D[1815-10-12]},
      %{name: "Turing", birthday: ~D[1912-06-23]}
    ]

    Enum.sort_by(users, &(&1.birthday), Date)
  end

  def start50 do
    Enum.split([1, 2, 3, 4], -5)
  end

  def start60 do
    Enum.split_while([1, 2, 3, 4], fn x -> x < 3 end)
  end

  def start61 do
    Enum.split_with(%{a: 1, b: -2, c: 3, d: -4}, fn {_k, v} -> v < 0 end)
  end

  def start62 do
    Enum.take([2, 3, 4, 5], -1)
  end

  def start63 do
    Enum.take_while([1, 2, 3, 4], fn x -> x < 3 end)
  end

  def start64 do
    Enum.to_list(1..40)
  end

  def start65 do
    Enum.unique_by([a: {:tea, 2}, b: {:tea, 3}, c: {:coffee, 1}], fn {_, y} -> y end)
  end

  def start66 do
    Enum.unzip([{:a, 1}, {:b, 2}, {:c, 3}])
  end

  def start67 do
    Enum.with_index([:a, :b, :c], fn element, index -> {index, element} end)
  end

  def start68 do
    Enum.zip([[1, 2, 3], [:a, :b, :c], ["foo", "bar", "baz"]])
  end

  def start69 do
    enums = [[1, 1], [2, 2], [3, 3]]
    Enum.zip_reduce(enums, [], fn elements, acc ->
      [List.to_tuple(elements) | acc]
    end)
  end

  def start70 do
    Enum.zip_reduce([1, 2], [3, 4], [], fn x, y, acc -> [x + y | acc] end)
  end

  def start71 do
    Enum.zip_with([[1, 2], [3, 4], [5, 6]], fn [x, y, z] -> x + y + z end)
  end

  def start72 do
    left = %{:a => 1, 1 => 3}
    right = %{:a => 1, :b => 3}
    Enum.zip(left, right)
  end

  def start73 do
    Enum.zip_with([1, 2, 5, 6], [3, 4], fn x, y -> x + y end)
  end
end
