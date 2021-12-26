defmodule Example_Ac do
  def start do
    keywords = [a: 1, b: 2]
    keywords[:a]
  end

  def start2 do
    users = %{"john" => %{age: 27}, "sophia" => %{age: 25}}
    put_in(users["john"][:age], 28)
  end

  def start3 do
    user = %{"sophia" => %{age: 31}}
    put_in(user["sophia"].age, 22)
  end

  def start4 do
    languages = [
      %{name: "elixir", type: :functional},
      %{name: "python", type: :object_oriented}
    ]
    user = %{name: "john", languages: languages}
    update_in(user, [:languages, Access.all(), :name], &String.upcase/1)
  end

  def start5 do
    list = [%{name: "john"}, %{name: "mary"}]
    get_in(list, [Access.all(), :name])
    get_and_update_in(list, [Access.all(), :name], fn prev ->
      {prev, String.upcase(prev)}
    end)
  end

  def start6 do
    get_in([:a, :b, :c, :c], [Access.at!(3)])
  end

  def start7 do
    list = [%{name: "john", salary: 10}, %{name: "sophia", salary: 20}]
    get_in(list, [Access.filter(&(&1.salary > 18)), :name])
    get_and_update_in(list, [Access.filter(&(&1.salary <= 20)), :name], fn prev ->
      {prev, String.upcase(prev)}
    end)
  end

  def start8 do
    list = [%{name: "john", salary: 20}, %{name: "sophie", salary: 30}]
    pop_in(list, [Access.filter(&(&1.salary < 30)), :name])
  end

  def start9 do
    get_in(%{}, [Access.key(:user, %{}), Access.key(:name, "meg")])
  end

  def start10 do
    map = %{user: %{name: "john"}}
    get_in(map, [Access.key(:unknown, %{}), Access.key(:name, "john")])
    get_and_update_in(map, [Access.key(:user), Access.key(:name)], fn prev ->
      {prev, String.upcase(prev)}
    end)
  end

  def start11 do
    map = %{user: %{name: "SOPHIA"}}
    get_in(map, [Access.key!(:user), Access.key!(:name)])
    get_and_update_in(map, [Access.key!(:user), Access.key!(:name)], fn prev ->
      {prev, String.downcase(prev)}
    end)
  end

  def start12 do
    Access.pop(%{name: "Elixir", creator: "Valim"}, :name)
  end

  def start13 do
    Access.pop([name: "Elixir", creator: "Valim"], :creator)
  end
end
