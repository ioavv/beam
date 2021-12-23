defmodule Try do
  def start do
    try do
      2 != 2
    rescue
      ArgumentError ->
        IO.puts("Invalid argument given")
    catch
      value ->
        IO.puts("Caught #{inspect(value)}")
    else
      value ->
        IO.puts("Success! The result was #{inspect(value)}")
    after
      IO.puts("This is printed regardless if it failed or succeesed")
    end
  end

  def start2 do
    try do
      :erlang.error(:badarg)
    rescue
      ArgumentError ->
        :ok
    end
  end

  def start3 do
    try do
      throw(:some_value)
    catch
      thrown_value ->
        IO.puts("A value was thrown: #{inspect(thrown_value)}")
    end
  end

  def start4 do
    try do
      exit(:shutdown)
    catch
      :exit, value ->
        IO.puts("Exited with value #{inspect(value)}")
    end
  end

  def start5 do
    try do
      exit(:shutdown)
    catch
      kind, value when kind in [:exit, :throw] ->
        IO.puts("Caught exit or throw with value #{inspect(value)}")
    end
  end

  def start6 do
    x = 5
    try do
      1 / x
    rescue
      ArithmeticError ->
        :infinity
    else
      y when y < 1 and y > -1 ->
        :small
      _ ->
        :large
    end
  end

  def start7 do
    x = 1
    try do
      try do
        1 / x
      rescue
        # The TryClauseError cannot be rescued here:
        TryClauseError ->
          :error_a
      else
        0 ->
          :small
      end
    rescue
      TryClauseError ->
        :error_b
    end
  end

  def start8 do
    try do
      throw(:catch_this)
    catch
      :throw, :catch_this ->
        :it_was_caught
    else
      other ->
        {:else, other}
    end
  end
end
