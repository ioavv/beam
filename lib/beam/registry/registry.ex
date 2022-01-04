defmodule Example_Registry do

  def start do
    {:ok, _} = Registry.start_link(keys: :unique, name: Registry.ViaTest)
    name = {:via, Registry, {Registry.ViaTest, "agent"}}
    {:ok, _} = Agent.start_link(fn -> 0 end, name: name)
    Agent.get(name, & &1)
    Agent.update(name, &(&1 + 3))
    Agent.get(name, & &1)
  end

  def start2 do
    Registry.lookup(Registry.ViaTest, "agent")
  end

  def start3 do
    {:ok, _} =
      Registry.start_link(
        keys: :duplicate,
        name: Registry.PubSubTest,
        partitions: System.schedulers_online()
      )

    {:ok, _} = Registry.register(Registry.PubSubTest, "hello", [])

    Registry.dispatch(Registry.PubSubTest, "hello", fn entries ->
      for {pid, _} <- entries, do: send(pid, {:broadcast, "world"})
    end)
  end

  def start4 do
    Registry.start_link(keys: :unique, name: Registry.UniqueCountTest)
    Registry.count(Registry.UniqueCountTest)
    {:ok, _} = Registry.register(Registry.UniqueCountTest, "hello", :world)
    {:ok, _} = Registry.register(Registry.UniqueCountTest, "world", :world)
    Registry.count(Registry.UniqueCountTest)
  end

  def start5 do
    Registry.start_link(keys: :duplicate, name: Registry.CountMatchTest)
    {:ok, _} = Registry.register(Registry.CountMatchTest, "hello", {1, :atom, 1})
    {:ok, _} = Registry.register(Registry.CountMatchTest, "hello", {2, :atom, 2})
    Registry.count_match(Registry.CountMatchTest, "hello", {1, :_, :_})
  end

  def start6 do
    Registry.start_link(keys: :unique, name: Registry.CountSelectTest)
    {:ok, _} = Registry.register(Registry.CountSelectTest, "hello", :value)
    {:ok, _} = Registry.register(Registry.CountSelectTest, "world", :value)
    Registry.count_select(Registry.CountSelectTest, [{{:_, :_, :value}, [], [true]}])
  end

  def start7 do
    Registry.start_link(keys: :unique, name: Registry.DeleteMetaTest)
    Registry.put_meta(Registry.DeleteMetaTest, :custom_key, "custom_value")
    Registry.meta(Registry.DeleteMetaTest, :custom_key)
  end

  def start8 do
    Registry.start_link(keys: :unique, name: Registry.UniqueKeysTest)
    Registry.keys(Registry.UniqueKeysTest, self())
    {:ok, _} = Registry.register(Registry.UniqueKeysTest, "hello", :world)
    Registry.register(Registry.UniqueKeysTest, "hello", :later) # registry is :unique
    Registry.keys(Registry.UniqueKeysTest, self())
  end

  def start9 do
    Registry.start_link(keys: :unique, name: Registry.UniqueLookupTest)
    Registry.lookup(Registry.UniqueLookupTest, "hello")
    {:ok, _} = Registry.register(Registry.UniqueLookupTest, "hello", :world)
    Registry.lookup(Registry.UniqueLookupTest, "hello")
    Task.async(fn -> Registry.lookup(Registry.UniqueLookupTest, "hello") end) |> Task.await()
  end

  def start10 do
    Registry.start_link(keys: :duplicate, name: Registry.MatchTest)
    {:ok, _} = Registry.register(Registry.MatchTest, "hello", {1, :atom, 1})
    {:ok, _} = Registry.register(Registry.MatchTest, "hello", {2, :atom, 2})
    Registry.match(Registry.MatchTest, "hello", {1, :_, :_})
  end

  def start11 do
    Registry.start_link(keys: :unique, name: Registry.SelectAllTest)
    {:ok, _} = Registry.register(Registry.SelectAllTest, "hello", :value)
    {:ok, _} = Registry.register(Registry.SelectAllTest, "world", :value)
    Registry.select(Registry.SelectAllTest, [{{:"$1", :"$2", :"$3"}, [], [{{:"$1", :"$2", :"$3"}}]}])
  end

  def start12 do
    Registry.start_link(keys: :unique, name: Registry.SelectAllTest)
    {:ok, _} = Registry.register(Registry.SelectAllTest, "hello", :value)
    {:ok, _} = Registry.register(Registry.SelectAllTest, "world", :value)
    Registry.select(Registry.SelectAllTest, [{{:"$1", :_, :_}, [], [:"$1"]}])
  end

  def start13 do
    Registry.start_link(keys: :unique, name: Registry.UniqueUnregisterTest)
    Registry.register(Registry.UniqueUnregisterTest, "hello", :world)
    Registry.keys(Registry.UniqueUnregisterTest, self())
  end

  def start14 do
    Registry.start_link(keys: :unique, name: Registry.UniqueUnregisterMatchTest)
    Registry.register(Registry.UniqueUnregisterMatchTest, "hello", :world)
    Registry.keys(Registry.UniqueUnregisterMatchTest, self())
    Registry.unregister_match(Registry.UniqueUnregisterMatchTest, "hello", :foo)
    Registry.keys(Registry.UniqueUnregisterMatchTest, self())
  end

  def start15 do
    Registry.start_link(keys: :duplicate, name: Registry.DuplicateUnregisterMatchTest)
    Registry.register(Registry.DuplicateUnregisterMatchTest, "hello", :world_a)
    Registry.register(Registry.DuplicateUnregisterMatchTest, "hello", :world_b)
    Registry.register(Registry.DuplicateUnregisterMatchTest, "hello", :world_c)
    Registry.keys(Registry.DuplicateUnregisterMatchTest, self())
  end

  def start16 do

  end
end
