defmodule Hygiene do
  defmacro no_interference do
    quote do
      a = 1
    end
  end
end

defmodule NoHygiene do
  defmacro interference do
    quote do
      var!(a) = 1
    end
  end
end

defmodule ContextHygiene do
  defmacro write do
    quote do
      var!(a, ContextHygiene) = 1
    end
  end

  defmacro read do
    quote do
      var!(a, ContextHygiene)
    end
  end
end

# Alias Inside Quote
defmodule Hygiene2 do
  alias Map, as: M

  defmacro no_interference do
    quote do
      M.new()
    end
  end
end

# Hygiene in Imports
defmodule Hygiene3 do
  defmacrop get_length do
    quote do
      length([1, 2, 3])
    end
  end

  def return_length do
    import Kernel, except: [length: 1]
    get_length
  end
end

defmodule Lazy do
  defmacrop get_length do
    import Kernel, except: [length: 1]

    quote do
      length("hello")
    end
  end

  def return_length do
    import Kernel, except: [length: 1]
    import String, only: [length: 1]
    get_length
  end
end
