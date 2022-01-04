defmodule Example_Code do

  defmodule MyTracer do
    def trace({:remote_function, _meta, module, name, arity}, env) do
      IO.puts "#{env.file}:#{env.line} #{inspect(module)}.#{name}/#{arity}"
      :ok
    end

    def trace(_event, _env) do
      :ok
    end
  end

  def start do
    Code.append_path(".")
  end

  def start2 do
    Code.available_compiler_options()
  end

  def start3 do
    Code.compile_options()
  end

  def start4 do
    Code.prepend_path(".")
    Code.delete_path(".")
  end

  def start5 do
    Code.ensure_loaded(Atom)
  end

  def start6 do
    Code.ensure_loaded?(Atom)
  end

  def start7 do
    contents = quote(do: var!(a) + var!(b))
    {result, binding} = Code.eval_quoted(contents, [a: 1, b: 2], file: __ENV__.file, line: __ENV__.line)
     result

     Enum.sort(binding)
  end

  def start8 do
    contents = quote(do: var!(a) + var!(b))
    {result, binding} = Code.eval_quoted(contents, [a: 1, b: 2], __ENV__)
    result
    Enum.sort(binding)
  end

  def start9 do
    {result, binding} = Code.eval_string("c = a + b", [a: 1, b: 2], __ENV__)
    result
  end

  def start10 do
    {result, binding} = Code.eval_string("a + b", [a: 1, b: 2], __ENV__)
    result

  end

  def start11 do
    {:docs_v1, _, :elixir, _, %{"en" => module_doc}, _, _} = Code.fetch_docs(Atom)
    module_doc |> String.split("\n") |> Enum.at(0)
  end

  def start12 do
    Code.string_to_quoted_with_comments(":foo # :bar")
  end
end
