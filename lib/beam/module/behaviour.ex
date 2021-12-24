defmodule URI.Parser do
  @doc "Define a deafult port"
  @callback default_port() :: integer

  @doc "Parses the given URL"
  @callback parse(uri_info :: URI.t()) :: URI.t()
end

defmodule URI.HTTP do
  @behaviour URI.Parser
  def default_port(), do: 80
  def parse(info), do: info
end

defmodule Foo do
  @behaviour Bar
  @behaviour Baz

  # Will warn if neither Bar nor Baz specify a callback named bar/0.
  @impl true
  def bar(), do: :ok

  # Will warn if Baz does not specify a callback named baz/0.
  @impl Baz
  def baz(), do: :ok
end

defmodule MyModule do
  @compile {:inline, my_fun: 1}

  def my_fun(arg) do
    to_string(arg)
  end
end

defmodule MyModule1 do
  @typedoc "This type"
  @typedoc since: "1.1.0"
  @type t :: term

  @doc "Hello world"
  @doc since: "1.1.0"
  def hello do
    "world"
  end

  @doc """
  Sums `a` to `b`.
  """
  def sum(a, b) do
    a + b
  end
end

defmodule MyModule3 do
  @doc "Hello world"
  @file "hello.ex"
  def hello do
    "world"
  end
end

defmodule A do
  defmacro __before_compile__(_env) do
    quote do
      def hello, do: "world"
    end
  end
end

defmodule B do
  @before_compile A
end
