defmodule MyModule do
  require Record
  Record.defrecord(:user, name: "john", age: 29)

  @type user :: record(:user, name: String.t(), age: integer)
end
