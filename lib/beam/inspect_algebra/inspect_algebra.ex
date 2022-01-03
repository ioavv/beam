defmodule Inspect_Algebra do
  def start do
    doc = Inspect.Algebra.concat(Inspect.Algebra.empty(), "elixir")
    Inspect.Algebra.format(doc, 80)
  end

  def start2 do
    doc = Inspect.Algebra.glue("a", " ", "b")
    doc = Inspect.Algebra.group(doc)
    Inspect.Algebra.format(doc, 80)
  end

  def start3 do
    doc = Inspect.Algebra.glue(String.duplicate("a", 20), " ", "b")
    doc = Inspect.Algebra.group(doc)
    Inspect.Algebra.format(doc, 10)
  end

  def start4 do
    doc = Inspect.Algebra.concat(["a", Inspect.Algebra.break("\t"), "b"])
    Inspect.Algebra.format(doc, 80)
  end

  def start5 do
    break = Inspect.Algebra.break("\t")
    doc = Inspect.Algebra.concat([String.duplicate("a", 20), break, "b"])
    doc = Inspect.Algebra.group(doc)
    Inspect.Algebra.format(doc, 10)
  end

  def start6 do
    doc = Inspect.Algebra.concat(["a", "b", "c"])
    Inspect.Algebra.format(doc, 80)
  end

  def start7 do
    doc = Inspect.Algebra.concat("hello", "world")
    Inspect.Algebra.format(doc, 80)
  end

  def start8 do
    inspect_opts = %Inspect.Opts{limit: :infinity}
    fun = fn i, _opts -> to_string(i) end
    doc = Inspect.Algebra.container_doc("[", Enum.to_list(1..5), "]", inspect_opts, fun)
    Inspect.Algebra.format(doc, 5) |> IO.iodata_to_binary()
  end

  def start9 do
    inspect_opts = %Inspect.Opts{limit: 3}
    fun = fn i, _opts -> to_string(i) end
    opts = [separator: "!"]
    doc = Inspect.Algebra.container_doc("[", Enum.to_list(1..5), "]", inspect_opts, fun, opts)
    Inspect.Algebra.format(doc, 20) |> IO.iodata_to_binary()
  end

  def start10 do
    docs = ["A", "B", "C"]
    docs =
    Inspect.Algebra.fold_doc(docs, fn doc, acc ->
      Inspect.Algebra.concat([doc, "!", acc])
    end)
    Inspect.Algebra.format(docs, 80)
  end

  def start11 do
    doc = Inspect.Algebra.glue("hello", " ", "world")
    doc = Inspect.Algebra.group(doc)
    doc |> Inspect.Algebra.format(30) |> IO.iodata_to_binary()
  end

  def start12 do
    doc = Inspect.Algebra.glue("hello", "\t", "world")
    Inspect.Algebra.format(doc, 80)
  end

  def start13 do
    doc =
      Inspect.Algebra.group(
        Inspect.Algebra.concat(
          Inspect.Algebra.group(
            Inspect.Algebra.concat(
              "Hello,",
              Inspect.Algebra.concat(
                Inspect.Algebra.break(),
                "A"
              )
            )
          ),
          Inspect.Algebra.concat(
            Inspect.Algebra.break(),
            "B"
          )
        )
      )

      Inspect.Algebra.format(doc, 80)
  end

  def start13 do
    doc =
      Inspect.Algebra.concat(
        Inspect.Algebra.concat(
          "Hughes",
          Inspect.Algebra.line()
        ),
        "Wadler"
      )
    Inspect.Algebra.format(doc, 80)
  end

  def start14 do
    doc = Inspect.Algebra.nest(Inspect.Algebra.glue("hello", "world"), 5)
    doc = Inspect.Algebra.group(doc)
    Inspect.Algebra.format(doc, 5)
  end

  def start15 do
    doc = Inspect.Algebra.space("Hughes", "Wadler")
    Inspect.Algebra.format(doc, 5)
  end

  def start16 do
    string = Inspect.Algebra.string("olá")
    doc = Inspect.Algebra.glue(string, " ", "mundo")
    doc = Inspect.Algebra.group(doc)
    Inspect.Algebra.format(doc, 9)
  end
end
