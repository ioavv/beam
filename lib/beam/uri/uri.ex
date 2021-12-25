defmodule Example_Ur do
  def start do
    URI.char_reserved?(?+)
  end

  def start2 do
    URI.char_unescaped?(?{)
  end

  def start3 do
    URI.char_unreserved?(?_)
  end

  def start4 do
    URI.decode("https%3A%2F%2Felixir-lang.org")
  end

  def start5 do
    URI.decode_query("percent=oh+yes%21", %{"starting" => "map"})
  end

  def start6 do
    URI.decode_www_form("%3Call+in%2F")
  end

  def start7 do
    URI.default_port("ponzi")
  end

  def start8 do
    URI.encode("ftp://s-ite.tld/?value=put it+й")
  end

  def start9 do
    query = %{"foo" => 1, "bar" => 2}
    URI.encode_query(query)
  end

  def start10 do
    URI.encode_www_form("put: it+й")
  end

  def start11 do
    URI.merge("http://example.com", "http://google.com") |> to_string()
  end

  def start12 do
    URI.new("https://elixir-lang.org/")
  end

  def start13 do
    URI.query_decoder("food=bread%26butter&drinks=tap%20water+please") |> Enum.to_list()
  end
end
