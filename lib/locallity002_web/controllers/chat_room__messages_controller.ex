defmodule Locallity002Web.ChatRoom_MessagesController do
  use Locallity002Web, :controller

  alias Locallity002.Chat
  alias Locallity002.Chat.ChatRoom_Messages

  def index(conn, _params) do
    chatmessages = Chat.list_chatmessages()
    render(conn, "index.html", chatmessages: chatmessages)
  end

  def new(conn, _params) do
    changeset = Chat.change_chat_room__messages(%ChatRoom_Messages{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"chat_room__messages" => chat_room__messages_params}) do
    case Chat.create_chat_room__messages(chat_room__messages_params) do
      {:ok, chat_room__messages} ->
        conn
        |> put_flash(:info, "Chat room  messages created successfully.")
        |> redirect(to: Routes.chat_room__messages_path(conn, :show, chat_room__messages))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    chat_room__messages = Chat.get_chat_room__messages!(id)
    render(conn, "show.html", chat_room__messages: chat_room__messages)
  end

  def edit(conn, %{"id" => id}) do
    chat_room__messages = Chat.get_chat_room__messages!(id)
    changeset = Chat.change_chat_room__messages(chat_room__messages)
    render(conn, "edit.html", chat_room__messages: chat_room__messages, changeset: changeset)
  end

  def update(conn, %{"id" => id, "chat_room__messages" => chat_room__messages_params}) do
    chat_room__messages = Chat.get_chat_room__messages!(id)

    case Chat.update_chat_room__messages(chat_room__messages, chat_room__messages_params) do
      {:ok, chat_room__messages} ->
        conn
        |> put_flash(:info, "Chat room  messages updated successfully.")
        |> redirect(to: Routes.chat_room__messages_path(conn, :show, chat_room__messages))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", chat_room__messages: chat_room__messages, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    chat_room__messages = Chat.get_chat_room__messages!(id)
    {:ok, _chat_room__messages} = Chat.delete_chat_room__messages(chat_room__messages)

    conn
    |> put_flash(:info, "Chat room  messages deleted successfully.")
    |> redirect(to: Routes.chat_room__messages_path(conn, :index))
  end
end
