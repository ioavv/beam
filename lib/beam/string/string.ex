defmodule Example_St do
  def start do
    String.length("alixiranderlang")
  end

  def start2 do
    take_prefix = fn full, prefix ->
      base = String.length(prefix)
      String.slice(full, base, String.length(full) - base)
    end

    take_prefix.("Mr. John", "Mr. ")
  end

  def start3 do
    String.codepoints("functional")
  end

  def start4 do
    String.to_charlist("erlangandbeam")
  end

  def start5 do
    pattern = :binary.compile_pattern([" ", "!"])
    String.split("foo bar!", pattern)
  end

  def start6 do
    String.bag_distance("abcd", "abc")
  end

  def start7 do
    String.capitalize("norway")
  end

  def start8 do
    String.contains?("Elixir of life", ["death", "Elixir"])
  end

  def start9 do
    String.downcase("ERLANGISAWESOME")
  end

  def start10 do
    String.equivalent?("yes", "yes")
  end

  def start11 do
    string1 = "fox hops over the dog"
    string2 = "fox jumps over the lazy cat"
    String.myers_difference(string1, string2)
  end

  def start12 do
    String.pad_leading("abcd", 5, "23")
  end

  def start13 do
    String.replace("a,b,c", ["a", "c"], fn <<char>> -> <<char + 1>> end)
  end

  def start14 do
    String.reverse(String.reverse("Hello world"))
  end

  def start15 do
    String.slice("elixir", 1..-2//1)
  end

  def start16 do
    String.splitter("1,2 3,4 5,6 7,8,...,99999", [" ", ","]) |> Enum.take(4)
  end

  def start17 do
    String.starts_with?("elixir", ["erlang", "elixir"])
  end

  def start18 do
    String.trim_leading("__ abc _", "_")
  end

  def start19 do
    String.valid?("asd" <> <<0xFFFF::16>>)
  end
end
