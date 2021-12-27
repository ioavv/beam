defmodule Example_Li do
  def start do
    [1, "two", :three, 4]
  end

  def start2 do
    [1, true, 3, 4, false] -- [true, false]
  end

  def start3 do
    new = 0
    list = [1, 2, 3, 4]
    [new | list]
  end

  def start4 do
    [head | tail] = [1, 2, 3, 4, 5]
  end

  def start5 do
    list = [1, 2, 3]
    list ++ [4, 5]
  end

  def start6 do
    List.asii_printable?('abc')
  end

  def start7 do
    List.delete([:a, :b, :c, 4], :c)
  end

  def start8 do
    List.delete_at([1, 3, 5, 7], 2)
  end

  def start9 do
    List.duplicate(["elixir", "erlang"], 10)
  end

  def start10 do
    List.flatten([[1, [2, 3], 4]])
  end

  def start11 do
    List.foldl([1, 2, 3, 4], fn x, {y, z} -> {y + x, z - x} end)
  end

  def start12 do
    List.foldr([1, 2, 3, 4], %{sum: 0, product: 1}, fn x, %{sum: a1, product: a2} -> %{sum: a1 + x, product: a2 * x} end)
  end

  def start13 do
    List.improper?([1, 2 | 3])
  end

  def start14 do
    List.insert_at([1, 2, 3, 4, 5], 2, 0)
  end

  def start15 do
    List.key_delete([a: 2, b: 2, c: 5], :c, 1)
  end

  def start16 do
    List.keyfind([a: 1, b: 2], :c, 0)
  end

  def start17 do
    List.keyfind!([a: 1, b: 2], 2, 1)
  end

  def start18 do
    List.keyreplace([a: 1, b: 2], :a, 0, {:a, 3})
  end

  def start19 do
    List.keysort([a: 5, c: 1, b: 3], 0)
  end

  def start20 do
    users = [
      {"Ellis", ~D[2013-03-03]},
      {"Lovelace", ~D[1994-02-02]},
      {"Zev", ~D[1812-11-12]}
    ]

    List.keysort(users, 1, Date)
  end

  def start21 do
    List.keystore([a: 1, b: 3], :c, 0, {:c, 5})
  end

  def start22 do
    List.keytake([a: 1, b: 2], 2, 1)
  end

  def start23 do
    List.last([1, 2, 3])
  end

  def start24 do
    List.myers_difference([1, 2, 3, 4], [1, 4, 2, 3])
  end

  def start25 do
    List.myers_difference(["a", "db", "c"], ["a", "bc"], &String.myers_difference/2)
  end

  def start26 do
    List.pop_at([1, 3, 5, 7, 9, 11, 13], 3)
  end

  def start27 do
    List.replace_at([1, 2, 3, 4, 5], 2, 456)
  end

  def start28 do
    List.starts_with?([1, 2, 3], [1, 2])
  end

  def start29 do
    List.to_atom('Elixir')
  end

  def start30 do
    List.to_charlist([0x00E6, 0x00DF])
  end

  def start31 do
    List.to_integer('123')
  end

  def start32 do
    List.update_at([1, 2, 3, 4], 2, &(&1 * 50))
  end

  def start33 do
    List.wrap("hellooooo")
  end

  def start34 do
    List.zip([[1, 2], [3, 4], [5, 6]])
  end
end
