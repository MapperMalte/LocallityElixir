defmodule Locallity002Web.ChatRoom_MessagesControllerTest do
  use Locallity002Web.ConnCase

  alias Locallity002.Chat

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:chat_room__messages) do
    {:ok, chat_room__messages} = Chat.create_chat_room__messages(@create_attrs)
    chat_room__messages
  end

  describe "index" do
    test "lists all chatmessages", %{conn: conn} do
      conn = get(conn, Routes.chat_room__messages_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Chatmessages"
    end
  end

  describe "new chat_room__messages" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.chat_room__messages_path(conn, :new))
      assert html_response(conn, 200) =~ "New Chat room  messages"
    end
  end

  describe "create chat_room__messages" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.chat_room__messages_path(conn, :create), chat_room__messages: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.chat_room__messages_path(conn, :show, id)

      conn = get(conn, Routes.chat_room__messages_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Chat room  messages"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.chat_room__messages_path(conn, :create), chat_room__messages: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Chat room  messages"
    end
  end

  describe "edit chat_room__messages" do
    setup [:create_chat_room__messages]

    test "renders form for editing chosen chat_room__messages", %{conn: conn, chat_room__messages: chat_room__messages} do
      conn = get(conn, Routes.chat_room__messages_path(conn, :edit, chat_room__messages))
      assert html_response(conn, 200) =~ "Edit Chat room  messages"
    end
  end

  describe "update chat_room__messages" do
    setup [:create_chat_room__messages]

    test "redirects when data is valid", %{conn: conn, chat_room__messages: chat_room__messages} do
      conn = put(conn, Routes.chat_room__messages_path(conn, :update, chat_room__messages), chat_room__messages: @update_attrs)
      assert redirected_to(conn) == Routes.chat_room__messages_path(conn, :show, chat_room__messages)

      conn = get(conn, Routes.chat_room__messages_path(conn, :show, chat_room__messages))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, chat_room__messages: chat_room__messages} do
      conn = put(conn, Routes.chat_room__messages_path(conn, :update, chat_room__messages), chat_room__messages: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Chat room  messages"
    end
  end

  describe "delete chat_room__messages" do
    setup [:create_chat_room__messages]

    test "deletes chosen chat_room__messages", %{conn: conn, chat_room__messages: chat_room__messages} do
      conn = delete(conn, Routes.chat_room__messages_path(conn, :delete, chat_room__messages))
      assert redirected_to(conn) == Routes.chat_room__messages_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.chat_room__messages_path(conn, :show, chat_room__messages))
      end
    end
  end

  defp create_chat_room__messages(_) do
    chat_room__messages = fixture(:chat_room__messages)
    %{chat_room__messages: chat_room__messages}
  end
end
