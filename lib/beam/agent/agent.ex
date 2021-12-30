defmodule Example_Ag do
  defmodule Counter do
    use Agent

    def start_link(initial_value) do
      Agent.start_link(fn -> initial_value end, name: __MODULE__)
    end

    def value do
      Agent.get(__MODULE__, & &1)
    end

    def increment do
      Agent.update(__MODULE__, &(&1 + 2))
    end
  end

  def start2 do
    {:ok, pid} = Agent.start_link(fn -> 200 end)
    Agent.cast(pid, fn state -> state * 2 end)
    Agent.get(pid, fn state -> state end)
  end

  def start3 do
    {:ok, pid} = Agent.start_link(fn -> 44 end)
    Agent.cast(pid, Kernel, :+, [12])
    Agent.get(pid, fn state -> state end)
  end

  def start4 do
    {:ok, pid} = Agent.start_link(fn -> 44 end)
    Agent.get_and_update(pid, fn state -> {state, state + 1} end)
    Agent.get(pid, fn state -> state end)
  end
end
