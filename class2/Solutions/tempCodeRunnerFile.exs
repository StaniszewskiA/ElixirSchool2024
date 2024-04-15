defmodule Echo do
  def spawn_echo_process do
    {:ok, pid} = Process.spawn(__MODULE__, :handle_message, [])
    Process.register(:echo, pid)
  end

  defp handle_message(msg) do
    sender = Process.whereis(:echo)
    send(sender, msg)
  end
end

spawn(Echo, :spawn_echo_process, [])

messages = [:first, {:second, :message}, %{"third" => 1}]

for msg <- messages do
  send(:echo, msg)

  receive do
    ^msg -> :ok
    msg -> {:error, "Unexpected message #{inspect(msg)}"}
  after
    100 -> :timeout
  end
end
