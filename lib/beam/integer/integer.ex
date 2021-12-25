defmodule Integers do


  def start2 do
    Integer.is_odd(6)
  end

  def start3 do
    Integer.digits(-170, 2)
  end

  def start4 do
    Integer.extended_gcd(-260, 40)
  end

  def start5 do
    Integer.floor_div(5, -3)
  end

  def start6 do
    Integer.gcd(20, 60)

    # GCD = Greatest Common Divisor
  end

  def start7 do
    Integer.mod(6, 2)
  end

  def start8 do
    Integer.pow(2, 64)
  end

  def start9 do
    Integer.to_charlist(-100, 16)
  end

  def start10 do
    Integer.to_string(882_681_651, 36)
  end

  def start11 do
    Integer.undigits([2, 12], 50)
  end
end
