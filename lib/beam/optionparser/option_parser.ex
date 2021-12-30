defmodule Example_OP do
  def start do
    OptionParser.parse(["--debug"], strict: [debug: :boolean])
  end

  def start2 do
    OptionParser.parse(
      ["--source-path", "lib", "test/enum_test.exs", "--verbose"],
      strict: [source_path: :string, verbose: :boolean]
    )
  end

  def start3 do
    OptionParser.parse(["--no-op", "path/to/file"], switches: [op: :boolean])
  end

  def start4 do
    OptionParser.parse(["--unlock", "path/to/file"], strict: [unlock: :boolean])
  end

  def start5 do
    OptionParser.parse(["--limit", "xyz"], strict: [limit: :integer])
  end

  def start6 do
    OptionParser.parse(["-v", "-v"], aliases: [v: :verbose], strict: [verbose: :count])
  end

  def start7 do
    OptionParser.parse(
      ["--unlock", "path/to/file", "--unlock", "path/to/another/file"],
      strict: [unlock: :keep]
    )
  end

  def start8 do
    OptionParser.parse!(
      ["-l", "xyz", "-f", "bar"],
      switches: [limit: :integer, foo: :integer],
      aliases: [l: :limit, f: :foo]
    )
  end

  def start9 do

  end
end
