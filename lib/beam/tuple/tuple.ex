defmodule Example_Tu do
  def start do
    tuple = {:foo, :bar}
    Tuple.append(tuple, :baz)
  end

  def start1 do
    Tuple.duplicate(:hello, 3)
  end

  def start2 do
    Tuple.product({255, 255})
  end
end
