defmodule KintaiViz.SlackSuperVisor do

  def handle_webhook(event) do
    opts = [restart: :transient]
    Task.Supervisor.start_child(__MODULE__, KintaiViz.SlackWebhook, :handle_webhook, [event], opts)
    Task.Supervisor.start_child(__MODULE__, KintaiViz.SlackWebhook, :create_user, [event["user"]], opts)
  end
end
