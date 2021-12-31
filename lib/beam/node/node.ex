defmodule Example_No do
  def start do
    Node.alive?()
  end

  def start2 do
    Node.ping(:unknown_node)
  end

  def start3 do
    {:ok, pid} = Node.start(:example, :shortnames, 15000)
  end
end
