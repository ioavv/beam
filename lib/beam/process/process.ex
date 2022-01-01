defmodule Example_Pr do
  def start do
    Process.put(:comments, ["comment", "other comment"])
    Process.delete(:comments)
  end

  def start2 do
    pid = spawn(fn -> 2 * 3 end)
    ref = Process.monitor(pid)
    Process.demonitor(ref)
  end

  def start3 do
    Process.put(:locale, "fr")
    Process.get(:locale, "pt")
  end

  def start4 do
    Process.group_leader()
  end

  def start5 do
    Process.list()
  end

  def start6 do
    pid = spawn(fn -> 1 + 5 end)
    Process.monitor(pid)
    Process.exit(pid, :kill)
    receive do
      msg -> msg
    end
  end

  def start7 do
    Process.register(self(), :test)
    Process.registered()
  end
end
