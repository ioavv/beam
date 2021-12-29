defmodule Example_Ke do
  def start do
    Keyword.delete([a: 1, b: 2], :a)
  end

  def start2 do
    Keyword.drop([a: 1, b: 2, b: 3, c: 3, a: 5], [:b, :d])
  end

  def start3 do
    Keyword.equal?([a: 1, b: 2, a: 3], [b: 2, a: 3, a: 1])
  end

  def start4 do
    Keyword.from_keys([:foo, :bar, :baz], :atom)
  end

  def start5 do
    Keyword.get([a: 1], :b, 3)
  end

  def start6 do
    Keyword.get_and_update([a: 1], :a, fn current_value ->
      {current_value, "new_value!"}
    end)
  end

  def start7 do
    Keyword.get_and_update([a: 1], :b, fn current_value ->
      {current_value, "new_value!"}
    end)
  end

  def start8 do
    keyword = [a: 1]
    fun = fn ->
      13
    end

    Keyword.get_lazy(keyword, :a, fun)
  end

  def start9 do
    Keyword.get_values([a: 1, a: 3, a: 6], :a)
  end

  def start10 do
    Keyword.merge([a: 1, b: 2], [a: 3, d: 4, a: 5], fn :a, v1, v2 ->
      v1 + v2
    end)
  end

  def start11 do
    Keyword.new([{:a, 3}, {:c, 5}])
  end

  def start12 do
    keyword = [a: 1]

    fun = fn ->
      13
    end

    Keyword.pop_lazy(keyword, :a, fun)
  end

  def start13 do
    Keyword.pop_values([a: 1, a: 2, a: 3], :a)
  end

  def start14 do
    Keyword.put([a: 1, b: 2], :a, 3)
  end

  def start15 do
    Keyword.replace([a: 1, b: 2, a: 4], :a, 3)
  end

  def start16 do
    Keyword.replace_lazy([a: 2, b: 2, a: 2], :a, fn v -> v * 4 end)
  end

  def start17 do
    Keyword.split([a: 1, b: 2, c: 3, a: 4], [:a, :c, :e])
  end

  def start18 do
    Keyword.take([a: 1, b: 2, c: 3, a: 5], [:a, :c, :e])
  end

  def start19 do
    Keyword.to_list(a: 2)
  end

  def start20 do
    Keyword.update([a: 12], :b, 15, fn value -> value * 5 end)
  end

  def start21 do
    {:ok, result} = Keyword.validate([], [one: 1, two: 2])
     Enum.sort(result)
  end

  def start22 do
    Keyword.validate([three: 3, four: 4], [one: 1, two: 2])
  end

  def start23 do
    Keyword.validate!([one: 1], [:one, two: 2]) |> Enum.sort()
  end

  def start24 do
    Keyword.values(a: 1, b: 2, a: 3)
  end
end
