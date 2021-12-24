defmodule Example_Re do
  def start do
    String.match?("123 456", ~r/^[[:alnum:][:blank:]]+$/)
  end

  def start2 do
    Regex.replace(~r/\s/, "Unicode\u00A0spaces", "-")
  end

  def start3 do
    Regex.compile("*foo")
  end

  def start4 do
    Regex.escape("\\what if")
  end

  def start5 do
    Regex.replace(~r/a(b|d)c/, "abcadc", fn _, x -> "[#{x}]" end)
  end

  def start6 do
    Regex.run(~r/c(d)/, "abcd", return: :index)
  end

  def start7 do
    Regex.scan(~r/=+/, "=ü†ƒ8===", return: :index)
  end

  def start8 do
    Regex.split(~r{a(?<second>b)c}, "abc", on: [:second], include_captures: true)
  end
end
