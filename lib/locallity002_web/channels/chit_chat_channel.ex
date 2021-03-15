defmodule Locallity002Web.ChitChatChannel do
  use Locallity002Web, :channel

  @impl true
  def join("chit_chat:lobby", payload, socket) do
    if authorized?(payload) do
      {:ok, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  # Channels can be used in a request/response fashion
  # by sending replies to requestws from the client
  @impl true
  def handle_in("ping", payload, socket) do
    {:reply, {:ok, payload}, socket}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (chit_chat:lobby).
  @impl true
  def handle_in("shout", payload, socket) do
    #Chat.Message.changeset(%Chat.Message{}, payload) |> Chat.Repo.insert
    broadcast socket, "shout", payload
    {:noreply, socket}
  end

  def handle_info(:after_join, socket) do
    Chat.Message.get_messages()
    |> Enum.each(fn msg -> push(socket, "shout", %{
      name: msg.name,
      message: msg.message,
    }) end)
    {:noreply, socket} # :noreply
  end
  
  def get_messages(limit \\ 20) do
    Chat.Repo.all(Chat.Message, limit: limit)
  end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
end
