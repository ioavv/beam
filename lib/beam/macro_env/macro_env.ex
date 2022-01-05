defmodule Example_MacroEnv do

  def start do
    Macro.Env.lookup_import(__ENV__, {:def, 1})
  end

  def start2 do
    Macro.Env.required?(__ENV__, Integer)
    Macro.Env.required?(__ENV__, Kernel)
  end
end
