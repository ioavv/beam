defmodule Example_Ti do
  def start do
    time = ~T[12:00:12.004]
    time.hour
  end

  def start2 do
    Time.add(~T[00:00:00], 86_399_999, :millisecond)
  end

  def start3 do
    Time.compare(~T[16:04:16.01], ~T[16:04:16.001])
  end

  def start4 do
    Time.compare(~N[2015-01-01 16:04:16.01], ~N[2000-01-01 16:04:16.001])
  end

  def start5 do
    Time.convert(~T[22:03:22], Calendar.Holocene)
  end

  def start6 do
    Time.diff(~N[2017-01-01 00:29:12], ~N[1900-02-03 00:29:10])
  end

  def start7 do
    Time.from_iso8601("2015:01:23 23-50-07")
  end

  def start8 do
    Time.from_seconds_after_midnight(30_000, {5000, 3})
  end
end
