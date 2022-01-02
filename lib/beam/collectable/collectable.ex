defmodule Example_Collectable do
  def start do
    Enum.into([a: 1, b: 2], %{})
  end

  def start2 do
    {initial_acc, collector_fun} = Collectable.into(MapSet.new())
    updated_acc = Enum.reduce([1, 2, 3], initial_acc, fn elem, acc ->
      collector_fun.(acc, {:cont, elem})
    end)
    collector_fun.(updated_acc, :done)
  end

  defimpl Collectable, for: MapSet do
    def into(map_set) do
      collector_fun = fn
        map_set_acc, {:cont, elem} ->
          MapSet.put(map_set_acc, elem)

        map_set_acc, :done ->
          map_set_acc

        _map_set_acc, :halt ->
          :ok
      end

      initial_acc = map_set

      {initial_acc, collector_fun}
    end
  end

  def start3 do
    Enum.into([1, 2, 3, 4, 5], MapSet.new())
  end

end
