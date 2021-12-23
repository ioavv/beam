defmodule Dates do
  def start do
    Date.diff(~D[2010-04-17], ~D[1970-01-01])
  end

  def start2 do
    Date.add(~D[1970-01-01], 14716)
  end

  def start3 do
    Date.add(~N[2000-01-01 09:00:00], 2)
  end

  def start4 do
    Date.beginning_of_month(~D[2000-01-01])
  end

  def start5 do
    Date.convert(~D[2000-01-01], Calendar.Holocene)
  end

  def start6 do
    Date.day_of_year(~D[2020-09-11])
  end

  def start7 do
    Date.from_erl({2000, 3, 5})
  end

  def start8 do
    Date.new(2000, 3, 5)
  end

  def start9 do
    range = Date.range(~D[1994-04-11], ~D[2016-11-12])
    Enum.count(range)
  end

  def start10 do
    range = Date.range(~D[1994-05-12], ~D[2018-10-04])
    Enum.member?(range, ~D[2016-04-04])
  end
end
