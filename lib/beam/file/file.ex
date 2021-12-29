defmodule Example_Fi do
  def start do
    File.read("Hello.txt")
  end

  def start2 do
    File.exists?("missings.txt")
  end

  def start3 do
    {:ok, file} = File.open("foo.tar.gz", [:read, :compressed])
    IO.read(file, :line)
    File.close(file)
  end

  def start4 do
    File.open("file.txt", [:read, :write], fn file ->
      IO.read(file, :line)
    end)
  end

  def start5 do
    File.regular?(__ENV__.file)
  end
end
