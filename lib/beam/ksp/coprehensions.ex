defmodule Comprehentions do
  def start1 do
    for n <- [2, 4, 5, 6, 7, 8], do: n * 5
  end

  def start2 do
    for x <- [2, 4, 6], y <- [3, 5, 9], do: x * y
  end

  def start3 do
    for n <- [1, 2, 3, 4, 5, 6], rem(n, 2) == 0, do: n
  end
end
