defmodule Example_Ma do
  def start do
    %{"hello" => "world", a: 2, b: 5}
  end

  def start2 do
    map = %{a: 2, b: 3}
    Map.fetch(map, :a)
  end

  def start3 do
    map = %{one: 1, teo: 2}
    %{map | one: "one"}
  end

  def start4 do
    Map.delete(%{a: 1, b: 2}, :a)
  end

  def start5 do
    Map.drop(%{a: 1, b: 2, c: 3}, :b, :d)
  end

  def start6 do
    Map.equal?(%{a: 1, b: 2}, %{b: 2, a: 1})
  end

  def start7 do
    Map.fetch(%{a: 1}, :a)
  end

  def start8 do
    Map.from_keys([1, 2, 3, 4, 5], :elixir)
  end

  def start9 do
    Map.get(%{a: 1}, :b, 3)
  end

  def start10 do
    Map.get_and_update(%{a: 5}, :a, fn current_value ->
      {current_value, "hello beam!!"}
    end)
  end

  def start11 do
    Map.has_key?(%{a: 2, b: 1}, :c)
  end

  def start12 do
    Map.keys(%{a: 1, b: 2})
  end

  def start13 do
    Map.merge(%{a: 1, b: 2}, %{a: 3, d: 4})
  end

  def start14 do
    Map.merge(%{a: 1, b: 2}, %{a: 3, d: 4}, fn _k, v1, v2 ->
      v1 + v2
    end)
  end

  def start15 do
    Map.new([{:a, 2}, {:b, 4}])
  end

  def start16 do
    Map.new([:a, :b], fn x -> {x, x} end)
  end

  def start17 do
    Map.pop(%{a: 3}, :b, 7)
  end

  def start18 do
    map = %{a: 5}
    fun = fn ->
      13
    end

    Map.pop_lazy(map, :a, fun)
  end

  def start19 do
    Map.put(%{a: 12}, :b, 44)
  end

  def start20 do
    Map.put_new(%{a: 1}, :b, 2)
  end

  def start21 do
    map = %{a: 13}
    fun = fn ->
      5
    end

    Map.put_new_lazy(map, :b, fun)
  end

  def start22 do
    Map.replace(%{a: 2, b: 3}, :b, 344445553)
  end

  def start23 do
    Map.update(%{a: 1}, :a, 13, fn value ->
      value * 2
    end)
  end

  def start24 do
    Map.replace_lazy(%{a: 23, b: 32}, :a, fn v -> v * 4 end)
  end

  def start25 do
    Map.split(%{a: 1, b: 2, c: 3}, [:a, :c, :e])
  end

  def start26 do
    Map.take(%{a: 1, b: 2, c: 3, d: 4}, [:a, :d, :f])
  end

  def start27 do
    Map.values(%{a: 3, b: 23})
  end
end
