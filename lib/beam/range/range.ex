defmodule Example_Ra do
  def start do
    range = 1..20
    Enum.reduce(range, 0, fn i, acc -> i * i + acc end)
  end

  def start2 do
    range = 1..12
    Enum.member?(range, 10)
  end

  def start3 do
    Range.disjoint?(1..5, 6..10)
  end

  def start4 do
    Range.disjoint?(1..28//14, 8..28//21)
  end

  def start5 do
    Range.new(-100, 100)
  end

  def start6 do
    Range.size(10..1//-3)
  end

end
