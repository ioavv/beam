defmodule Example_Ms do
  def start do
    MapSet.new([1, :two, {"three"}])
  end

  def start2 do
    MapSet.new([2]) |> MapSet.put(4) |> MapSet.put(2)
  end

  def start3 do
    map_set = MapSet.new()
    MapSet.put(map_set, "Hello Elixir!")
  end
  def start4 do
    map_set = MapSet.new([1, 2, 3, 4, 5, 6])
    MapSet.delete(map_set, 3)
  end

  def start5 do
    MapSet.difference(MapSet.new([1, 2]), MapSet.new([2, 3, 4]))
  end

  def start6 do
    MapSet.disjoint?(MapSet.new([1, 2]), MapSet.new([2, 3]))
  end

  def start7 do
    MapSet.equal?(MapSet.new([1, 2]), MapSet.new([2, 1, 1]))
  end

  def start8 do
    ab = [1, 3, 5, 7]
    MapSet.member?(MapSet.new([3, 6, 99, 21]), ab)
  end
  def start9 do
    MapSet.intersection(MapSet.new([1, 2, 3]), MapSet.new([2, 5, 7]))
  end

  def start10 do
    MapSet.new([1, 2, 2, 3, 3, 4, 4, 4, 4, 5])
  end

  def start11 do
    MapSet.new([2, 3, 2], fn x -> 230 * x end)
  end

  def start12 do
    MapSet.size(MapSet.new([2, 3, 4, 55555]))
  end

  def start13 do
    MapSet.subset?(MapSet.new([1, 2, 3]), MapSet.new([1, 2]))
  end

  def start14 do
    MapSet.to_list(MapSet.new([1, 2, 3, 4]))
  end

  def start15 do
    MapSet.union(MapSet.new([1, 2, 3]), MapSet.new([2, 3, 4]))
  end
end
