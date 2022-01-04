defmodule Inspect_OPTS do
  def start do
    previous_fun = Inspect.Opts.default_inspect_fun()

    Inspect.Opts.default_inspect_fun(fn
      %{address: _} = map, opts ->
        previous_fun.(%{map | address: "[REDACTED]"}, opts)

      value, opts ->
        previous_fun.(value, opts)
    end)
  end
end
