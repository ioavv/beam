defmodule Example_Task do
  def start do
    task = Task.async(fn -> do_some_work() end)
    ras = do_some_other_work()
    res + Task.await(task)
  end

  def start2 do
    {:ok, pid} = Task.Supervisor.start_link()

    task =
      Task.Supervisor.async(pid, fn ->
        # Do Something
      end)

      Task.await(task)
  end

  def start3 do

  end
end
