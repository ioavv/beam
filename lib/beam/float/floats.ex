defmodule Floats do
  def start do
    Float.ceil(56.34)
  end

  def start2 do
    Float.floor(34.53, 5)
  end

  def start3 do
    Float.parse("234.5xyz")
  end

  def start4 do
    Float.pow(2.0, 10)
  end

  def start5 do
    Float.ratio(3.15)
  end

  def start6 do
    Float.round(34.5)
  end

  def start7 do
    23.45 |> Float.to_charlist()
  end

  def start8 do
    1234.748274827 |> Float.to_string()
  end
end
