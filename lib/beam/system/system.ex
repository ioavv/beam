defmodule Example_Sy do
  def start do
    System.build_info()
  end

  def start2 do
    System.cmd("echo", ["hello"])
  end

  def start3 do
    System.cmd("echo", ["hello"], into: IO.stream())
  end

  def start4 do
    System.fetch_env("PORT")
  end

  def start5 do
    System.restart()
  end

  def start6 do
    System.version()
  end
end
