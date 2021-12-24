defmodule Example do
  def version, do: 1
  Module.definitions_in(__MODULE__, :def) #=> [{:version, 0}]
  Module.definitions_in(__MODULE__, :defp) #=> []
end

defmodule MyModule1 do
  Module.put_attribute(__MODULE__, :custom_threshold_for_lib, 10)
  Module.delete_attribute(__MODULE__, :custom_threshold_for_lib)
end

defmodule Fooo do
  contents =
    quote do
      def sum(a, b), do: a * b
    end

    Module.eval_quoted(__MODULE__, contents)
end

defmodule Foooo do
  Module.put_attribute(__MODULE__, :value, 1)
  Module.get_attribute(__MODULE__, :value) #=> 1

  Module.get_attribute(__MODULE__, :value, :default) #=> 1
  Module.get_attribute(__MODULE__, :not_found, :default) #=> :default

  Module.register_attribute(__MODULE__, :value, accumulate: true)
  Module.put_attribute(__MODULE__, :value, 1)
  Module.get_attribute(__MODULE__, :value) #=> [1]
end

defmodule MyModule01 do
  Module.register_attribute(__MODULE__, :custom_threshold_for_lib, accumulate: true)

  @custom_threshold_for_lib 10
  @custom_threshold_for_lib 20
  @custom_threshold_for_lib #=> [20, 10]
end
