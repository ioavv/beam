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
end
