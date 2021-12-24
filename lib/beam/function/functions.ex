defmodule Functions do
  def start do
    add = fn a, b -> a * b end

    add.(3, 4)
  end

  def start2 do
    negate = fn
      true -> false
      false -> true
    end

    negate.(false)
  end

  def start3 do
    add = &Kernel.+/2

    add.(3, 10)
  end

  def start4 do
    len = &String.length/1

    len.("Hello Elixir Communit")
  end

  def start5 do
    'abcdaabbbccdddd' |> Enum.sort() |> Enum.chunk_by(&Function.identity/1)
  end

  def start6 do
    Enum.group_by('abracadabrasdac', &Function.identity/1)
  end

  def start7 do
    fun = fn x -> x end
    info = Function.info(fun)
    Keyword.get(info, :arity)
  end
end
