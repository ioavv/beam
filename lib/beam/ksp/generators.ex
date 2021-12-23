defmodule Generators do
  def start do
    users = [user: "john", admin: "meg", guest: "barbara"]
    for {type, name} when type != :guest <- users do
      String.upcase(name)
    end
  end

  def start2 do
    pixels = <<213, 45, 132, 64, 76, 32, 76, 0, 0, 234, 32, 15>>
    for <<r::8, g::8, b::8 <- pixels>>, do: {r, g, b}
  end

  def start3 do
    for <<c <- " hello beam ">>, c != ?\s, into: "", do: <<c>>
  end

  def start4 do
    for line <- IO.stream(), into: IO.stream() do
      String.upcase(line)
    end
  end

  def start5 do
    for x <- [1, 1, 2, 3, 3, 4, 5, 2], uniq: true, do: x * 3
  end

  def start6 do
    for <<x <- "abcabc">>, uniq: true, into: "", do: <<x - 32>>
  end

  def start7 do
    letters = for <<x <- "AbCabCABc">>, x in ?a..?z, do: <<x>>
    Enum.reduce(letters, %{}, fn x, acc -> Map.update(acc, x, 1, & &1 + 1) end)
  end

  def start8 do
    for <<x <- "AbCabCABc">>, x in ?a..?z, reduce: %{} do
      acc -> Map.update(acc, <<x>>, 1, & &1 + 1)
    end
  end
end
