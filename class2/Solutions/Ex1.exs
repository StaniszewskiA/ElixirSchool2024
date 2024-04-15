defmodule Echo do
  def spawn_echo_process do
    {:ok, pid} = Process.spawn(__MODULE__, :handle_message)
    Process.register(:echo, pid)
    Process.sleep(1000)
  end

  defp handle_message(msg) do
    sender = Process.whereis(:echo)
    send(sender, msg)
    receive do
      _ -> handle_message(msg)
    end
  end
end

spawn(Echo, :spawn_echo_process, [])

messages = [:first, {:second, :message}, %{"third" => 1}]

for msg <- messages do
  try do
    send(:echo, msg)
  rescue
    ArgumentError -> IO.puts("Error: Echo process not available")
  end

  receive do
    ^msg -> :ok
    msg -> {:error, "Unexpected message #{inspect(msg)}"}
  after
    100 -> :timeout
  end

end
