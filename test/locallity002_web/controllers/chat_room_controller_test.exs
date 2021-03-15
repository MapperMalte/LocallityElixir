defmodule Locallity002Web.ChatRoomControllerTest do
  use Locallity002Web.ConnCase

  alias Locallity002.Chat

  @create_attrs %{type: 42}
  @update_attrs %{type: 43}
  @invalid_attrs %{type: nil}

  def fixture(:chat_room) do
    {:ok, chat_room} = Chat.create_chat_room(@create_attrs)
    chat_room
  end

  describe "index" do
    test "lists all chatrooms", %{conn: conn} do
      conn = get(conn, Routes.chat_room_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Chatrooms"
    end
  end

  describe "new chat_room" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.chat_room_path(conn, :new))
      assert html_response(conn, 200) =~ "New Chat room"
    end
  end

  describe "create chat_room" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.chat_room_path(conn, :create), chat_room: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.chat_room_path(conn, :show, id)

      conn = get(conn, Routes.chat_room_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Chat room"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.chat_room_path(conn, :create), chat_room: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Chat room"
    end
  end

  describe "edit chat_room" do
    setup [:create_chat_room]

    test "renders form for editing chosen chat_room", %{conn: conn, chat_room: chat_room} do
      conn = get(conn, Routes.chat_room_path(conn, :edit, chat_room))
      assert html_response(conn, 200) =~ "Edit Chat room"
    end
  end

  describe "update chat_room" do
    setup [:create_chat_room]

    test "redirects when data is valid", %{conn: conn, chat_room: chat_room} do
      conn = put(conn, Routes.chat_room_path(conn, :update, chat_room), chat_room: @update_attrs)
      assert redirected_to(conn) == Routes.chat_room_path(conn, :show, chat_room)

      conn = get(conn, Routes.chat_room_path(conn, :show, chat_room))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, chat_room: chat_room} do
      conn = put(conn, Routes.chat_room_path(conn, :update, chat_room), chat_room: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Chat room"
    end
  end

  describe "delete chat_room" do
    setup [:create_chat_room]

    test "deletes chosen chat_room", %{conn: conn, chat_room: chat_room} do
      conn = delete(conn, Routes.chat_room_path(conn, :delete, chat_room))
      assert redirected_to(conn) == Routes.chat_room_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.chat_room_path(conn, :show, chat_room))
      end
    end
  end

  defp create_chat_room(_) do
    chat_room = fixture(:chat_room)
    %{chat_room: chat_room}
  end
end
