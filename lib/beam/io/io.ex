defmodule Exxample_IO do
  def start do
    IO.binstream(:stdio, :line)
  end

  def start2 do
    IO.chardata_to_string([0x00E6, 0x00DF])
  end

  def start3 do
    IO.gets("what's your name ?\n")
  end

  def start4 do
    IO.inspect(<<0, 1, 2>>, width: 40)
  end

  def start5 do
    IO.inspect(1..200, label: "a wonderful range")
  end

  def start6 do
    [1, 2, 4, 5, 7, 8]
    |> IO.inspect(label: "before")
    |> Enum.map(&(&1 * 5))
    |> IO.inspect(label: "after")
    |> Enum.sum()
  end

  def start7 do
    IO.iodata_length([1, 2 | <<3, 4>>])
  end

  def start8 do
    bin1 = <<1, 2, 3>>
    bin2 = <<4, 5>>
    bin3 = <<6>>
    IO.iodata_to_binary([bin1, 1, [2, 3, bin2], 4 | bin3])
  end

  def start9 do
    IO.puts("Hello World!")
  end

  def start10 do
    IO.write("sample")
  end
end
