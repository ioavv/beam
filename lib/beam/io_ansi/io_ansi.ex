defmodule Example_IOANSI do
  def start do
    formatted_text = IO.ANSI.blue_background() <> "Example" <> IO.ANSI.reset()
    IO.puts(formatted_text)
  end

  def start2 do
     IO.ANSI.blue_background()
  end

  def start3 do
    IO.ANSI.format(["Hello, ", :red, :bright, "world!"], true)
  end

  def start4 do
    IO.ANSI.format_fragment([:bright, 'Word'], true)
  end

  def start5 do
    IO.ANSI.light_green()
  end
end
