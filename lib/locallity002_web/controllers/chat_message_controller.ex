defmodule Locallity002Web.ChatMessageController do
  use Locallity002Web, :controller

  alias Locallity002.Chat
  alias Locallity002.Chat.ChatMessage

  def index(conn, _params) do
    messages = Chat.list_messages()
    render(conn, "index.html", messages: messages)
  end

  def new(conn, _params) do
    changeset = Chat.change_chat_message(%ChatMessage{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"chat_message" => chat_message_params}) do
    case Chat.create_chat_message(chat_message_params) do
      {:ok, chat_message} ->
        conn
        |> put_flash(:info, "Chat message created successfully.")
        |> redirect(to: Routes.chat_message_path(conn, :show, chat_message))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    chat_message = Chat.get_chat_message!(id)
    render(conn, "show.html", chat_message: chat_message)
  end

  def edit(conn, %{"id" => id}) do
    chat_message = Chat.get_chat_message!(id)
    changeset = Chat.change_chat_message(chat_message)
    render(conn, "edit.html", chat_message: chat_message, changeset: changeset)
  end

  def update(conn, %{"id" => id, "chat_message" => chat_message_params}) do
    chat_message = Chat.get_chat_message!(id)

    case Chat.update_chat_message(chat_message, chat_message_params) do
      {:ok, chat_message} ->
        conn
        |> put_flash(:info, "Chat message updated successfully.")
        |> redirect(to: Routes.chat_message_path(conn, :show, chat_message))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", chat_message: chat_message, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    chat_message = Chat.get_chat_message!(id)
    {:ok, _chat_message} = Chat.delete_chat_message(chat_message)

    conn
    |> put_flash(:info, "Chat message deleted successfully.")
    |> redirect(to: Routes.chat_message_path(conn, :index))
  end
end
