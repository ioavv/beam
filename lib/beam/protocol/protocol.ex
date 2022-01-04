defprotocol Size do
  @doc "Calculates the size (and not the length!) of a data structure"
  def size(data)
end

defimpl Size, for: BitString do
  def size(binary), do: byte_size(binary)
end

defimpl Size, for: Map do
  def size(map), do: map_size(map)
end

defimpl Size, for: Tuple do
  def size(tuple), do: tuple_size(tuple)
end

defimpl Size, for: MapSet do
  def size(map_set), do: MapSet.size(map_set)
end

defprotocol Reversible do
  def reverse(term)
end

defimpl Reversible, for: [Map, List] do
  def reverse(term), do: Enum.reverse(term)
end

defprotocol Derivable do
  def ok(arg)
end

defimpl Derivable, for: Any do
  defmacro __deriving__(module, struct, options) do
    quote do
      defimpl Derivable, for: unquote(module) do
        def ok(arg) do
          {:ok, arg, unquote(Macro.escape(struct)), unquote(options)}
        end
      end
    end
  end

  def ok(arg) do
    {:ok, arg}
  end
end

defmodule ImplStruct do
  @derive [Derivable]
  defstruct a: 0, b: 0
end
