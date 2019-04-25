defmodule KintaiViz.SlackWebhook do
  def handle_webhook(params) do
    IO.puts(inspect(params))
  end
end
