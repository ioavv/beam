defmodule Example_Port do
  def start do
    port = Port.open({:spawn, "cat"}, [:binary])
    send(port, {self(), {:command, "hello"}})
    send(port, {self(), {:command, "world"}})
  end

  def start2 do
    port = Port.open({:spawn, "echo hello"}, [:binary])

  end

  def start3 do
    path = System.find_executable("echo")
    port = Port.open({:spawn_executable, path}, [:binary, args: ["hello world"]])

  end
end
