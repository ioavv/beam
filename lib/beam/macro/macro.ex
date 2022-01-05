defmodule Example_Macro do

  defmodule Example do
    defmacro macro_inspect(value) do
      IO.inspect(value)
      value
    end

    def fun_inspect(value) do
      IO.inspect(value)
      value
    end
  end

  defmodule MySigils do
    defmacro sigil_x(term, [?r]) do
      quote do
        unquote(term) |> String.reverse()
      end
    end
    defmacro sigil_x(term, _modifiers) do
      term
    end
    defmacro sigil_X(term, [?r]) do
      quote do
        unquote(term) |> String.reverse()
      end
    end
    defmacro sigil_X(term, _modifiers) do
      term
    end
  end

  def start do
    Macro.camelize("foo/bar")
  end

  def start2 do
    Macro.classify_atom(:foo)
  end

  def start3 do
    Macro.decompose_call(quote(do: Elixir.M.foo(1, 2, 3)))
  end

  def start4 do
    Macro.escape({:a, :b, :c})
  end

  def start5 do
    value = {:a, :b, :c}
    quote do: unquote(value)
  end

  defmacro defmodule_with_length(name, do: block) do
    length = length(Atom.to_charlist(name))

    quote do
      defmodule unquote(name) do
        def name_length, do: unquote(length)
        unquote(block)
      end
    end
  end

  defmacro defmodule_with_length(name, do: block) do
    expanded = Macro.expand(name, __CALLER__)
    length = length(Atom.to_charlist(expanded))

    quote do
      defmodule unquote(name) do
        def name_length, do: unquote(length)
        unquote(block)
      end
    end
  end

  def start6 do
    Macro.generate_arguments(2, __MODULE__)
  end

  def start7 do
    [var1, var2] = Macro.generate_unique_arguments(2, __MODULE__)
    {:arg1, [counter: c1], __MODULE__} = var1
    {:arg2, [counter: c2], __MODULE__} = var2
    is_integer(c1) and is_integer(c2)
  end

  def start8 do
    Macro.inspect_atom(:literal, Foo.Bar)
  end

  def start9 do
    Macro.inspect_atom(:remote_call, :Foo)
  end

  def start10 do
    Macro.operator?(:++, 2)
  end

  def start11 do
    ast = quote do: foo(1, "abc")
    Enum.map(Macro.postwalker(ast), & &1)
  end

  def start12 do
    ast = quote do: 5 + 3 * 7
    new_ast = Macro.prewalk(ast, fn
      {:+, meta, children} -> {:*, meta, children}
      {:*, meta, children} -> {:+, meta, children}
      other -> other
    end)

    Code.eval_quoted(ast)
    Code.eval_quoted(new_ast)
  end

  def start13 do
    ast = quote do: foo(1, "abc")
    Enum.map(Macro.prewalker(ast), & &1)
  end
end
