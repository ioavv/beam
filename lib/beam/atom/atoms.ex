defmodule Atoms do
  def start do
    :elixir == :elixir
  end

  def start2 do
    false == :false
  end

  def start3 do
    :"This is an atom with spaces"
  end

  def start4 do
    :elixir_erlang_beam_functional |> to_charlist()
  end
end
