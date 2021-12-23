defmodule Quote do

  # import Math
  # IO.put("Got #{squared(7)}")
  defmacro squared(x) do
    quote do
      unquote(x) * unquote(x)
    end
  end

  defmodule Math do
    defmacro squared(x) do
      quote do
        x = unquote(x)
        x * x
      end
    end
  end

  @moduledoc """
  :bind_quoted can be used in many cases and is seen as good practice,
   not only because it helps prevent us from running into common mistakes,
   but also because it allows us to leverage other tools exposed by macros,
   such as unquote fragments
  """

  defmodule Math2 do
    defmacro squared(x) do
      quote bind_quoted: [x: x] do
        x * x
      end
    end
  end
end
