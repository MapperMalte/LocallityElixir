defmodule Locallity002Web.ChatRoomController do
  use Locallity002Web, :controller

  alias Locallity002.Chat
  alias Locallity002.Chat.ChatRoom

  def index(conn, _params) do
    chatrooms = Chat.list_chatrooms()
    render(conn, "index.html", chatrooms: chatrooms)
  end

  def new(conn, _params) do
    changeset = Chat.change_chat_room(%ChatRoom{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"chat_room" => chat_room_params}) do
    case Chat.create_chat_room(chat_room_params) do
      {:ok, chat_room} ->
        conn
        |> put_flash(:info, "Chat room created successfully.")
        |> redirect(to: Routes.chat_room_path(conn, :show, chat_room))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    chat_room = Chat.get_chat_room!(id)
    render(conn, "show.html", chat_room: chat_room)
  end

  def edit(conn, %{"id" => id}) do
    chat_room = Chat.get_chat_room!(id)
    changeset = Chat.change_chat_room(chat_room)
    render(conn, "edit.html", chat_room: chat_room, changeset: changeset)
  end

  def update(conn, %{"id" => id, "chat_room" => chat_room_params}) do
    chat_room = Chat.get_chat_room!(id)

    case Chat.update_chat_room(chat_room, chat_room_params) do
      {:ok, chat_room} ->
        conn
        |> put_flash(:info, "Chat room updated successfully.")
        |> redirect(to: Routes.chat_room_path(conn, :show, chat_room))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", chat_room: chat_room, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    chat_room = Chat.get_chat_room!(id)
    {:ok, _chat_room} = Chat.delete_chat_room(chat_room)

    conn
    |> put_flash(:info, "Chat room deleted successfully.")
    |> redirect(to: Routes.chat_room_path(conn, :index))
  end
end
