defmodule Locallity002Web.ChatMessageControllerTest do
  use Locallity002Web.ConnCase

  alias Locallity002.Chat

  @create_attrs %{content: "some content", delivered: true, seen: true}
  @update_attrs %{content: "some updated content", delivered: false, seen: false}
  @invalid_attrs %{content: nil, delivered: nil, seen: nil}

  def fixture(:chat_message) do
    {:ok, chat_message} = Chat.create_chat_message(@create_attrs)
    chat_message
  end

  describe "index" do
    test "lists all messages", %{conn: conn} do
      conn = get(conn, Routes.chat_message_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Messages"
    end
  end

  describe "new chat_message" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.chat_message_path(conn, :new))
      assert html_response(conn, 200) =~ "New Chat message"
    end
  end

  describe "create chat_message" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.chat_message_path(conn, :create), chat_message: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.chat_message_path(conn, :show, id)

      conn = get(conn, Routes.chat_message_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Chat message"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.chat_message_path(conn, :create), chat_message: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Chat message"
    end
  end

  describe "edit chat_message" do
    setup [:create_chat_message]

    test "renders form for editing chosen chat_message", %{conn: conn, chat_message: chat_message} do
      conn = get(conn, Routes.chat_message_path(conn, :edit, chat_message))
      assert html_response(conn, 200) =~ "Edit Chat message"
    end
  end

  describe "update chat_message" do
    setup [:create_chat_message]

    test "redirects when data is valid", %{conn: conn, chat_message: chat_message} do
      conn = put(conn, Routes.chat_message_path(conn, :update, chat_message), chat_message: @update_attrs)
      assert redirected_to(conn) == Routes.chat_message_path(conn, :show, chat_message)

      conn = get(conn, Routes.chat_message_path(conn, :show, chat_message))
      assert html_response(conn, 200) =~ "some updated content"
    end

    test "renders errors when data is invalid", %{conn: conn, chat_message: chat_message} do
      conn = put(conn, Routes.chat_message_path(conn, :update, chat_message), chat_message: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Chat message"
    end
  end

  describe "delete chat_message" do
    setup [:create_chat_message]

    test "deletes chosen chat_message", %{conn: conn, chat_message: chat_message} do
      conn = delete(conn, Routes.chat_message_path(conn, :delete, chat_message))
      assert redirected_to(conn) == Routes.chat_message_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.chat_message_path(conn, :show, chat_message))
      end
    end
  end

  defp create_chat_message(_) do
    chat_message = fixture(:chat_message)
    %{chat_message: chat_message}
  end
end
