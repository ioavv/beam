defmodule BaseCode do
  def start do
    Base.decode16("666f6f626172", case: :lower)
  end

  def start2 do
    Base.decode32("MZXW6YTBOI", padding: false)
  end

  def start3 do
    Base.decode64("Zm9vYmFy\n", ignore: :whitespace)
  end

  def start4 do
    Base.encode16("foobar", case: :lower)
  end

  def start5 do
    Base.url_decode64("_3_-_A==\n", ignore: :whitespace)
  end
end
