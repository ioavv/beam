defmodule Example_StringIO do
  def start do
    {:ok, pid} = StringIO.open("foo")
    IO.read(pid, 2)
  end

  def start2 do
    {:ok, pid} = StringIO.open("in")
    IO.write(pid, "out")
    StringIO.close(pid)
  end

  def start3 do
    {:ok, pid} = StringIO.open("in")
    IO.write(pid, "out")
    StringIO.contents(pid)
  end

  def start4 do
    {:ok, pid} = String.open("in")
    IO.write(pid, "out")
    StringIO.flush(pid)
    StringIO.contents(pid)
  end

  def start5 do
    StringIO.open("foo", fn pid ->
      input = IO.gets(pid, ">")
      IO.write(pid, "The input was #{input}")
      StringIO.contents(pid)
    end)
  end

  def start6 do
    StringIO.open("foo", [capture_prompt: true], fn pid ->
      input = IO.gets(pid, ">")
      IO.write(pid, "The input was #{input}")
      StringIO.contents(pid)
    end)
  end
end
