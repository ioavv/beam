defimpl Inspect, for: MapSet do
  import Inspect.Algebra

  def inspect(map_set, opts) do
    concat(["#MapSet<", to_doc(MapSet.to_list(map_set), opts), ">"])
  end
end

defmodule User do
  @derive {Inspect, only: [:id, :name]}
  defstruct [:id, :name, :address]
end
