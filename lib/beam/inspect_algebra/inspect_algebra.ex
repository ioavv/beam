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

end
