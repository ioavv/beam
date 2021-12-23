defmodule Unquote do
  defmacro defkv(kv) do
    Enum.map(kv, fn {k, v} ->
      quote do
        def unquote(k)(), do: unquote(v)
      end
    end)
  end
end

defmodule Unquote2 do
  defmacro defkv(kv) do
    quote bind_quoted: [kv: kv] do
      Enum.each(kv, fn {k, v} ->
        def unquote(k)(), do: unquote(v)
      end)
    end
  end
end
