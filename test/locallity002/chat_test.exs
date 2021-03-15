defmodule Locallity002.ChatTest do
  use Locallity002.DataCase

  alias Locallity002.Chat

  describe "messages" do
    alias Locallity002.Chat.ChatMessage

    @valid_attrs %{content: "some content", delivered: true, seen: true}
    @update_attrs %{content: "some updated content", delivered: false, seen: false}
    @invalid_attrs %{content: nil, delivered: nil, seen: nil}

    def chat_message_fixture(attrs \\ %{}) do
      {:ok, chat_message} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Chat.create_chat_message()

      chat_message
    end

    test "list_messages/0 returns all messages" do
      chat_message = chat_message_fixture()
      assert Chat.list_messages() == [chat_message]
    end

    test "get_chat_message!/1 returns the chat_message with given id" do
      chat_message = chat_message_fixture()
      assert Chat.get_chat_message!(chat_message.id) == chat_message
    end

    test "create_chat_message/1 with valid data creates a chat_message" do
      assert {:ok, %ChatMessage{} = chat_message} = Chat.create_chat_message(@valid_attrs)
      assert chat_message.content == "some content"
      assert chat_message.delivered == true
      assert chat_message.seen == true
    end

    test "create_chat_message/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Chat.create_chat_message(@invalid_attrs)
    end

    test "update_chat_message/2 with valid data updates the chat_message" do
      chat_message = chat_message_fixture()
      assert {:ok, %ChatMessage{} = chat_message} = Chat.update_chat_message(chat_message, @update_attrs)
      assert chat_message.content == "some updated content"
      assert chat_message.delivered == false
      assert chat_message.seen == false
    end

    test "update_chat_message/2 with invalid data returns error changeset" do
      chat_message = chat_message_fixture()
      assert {:error, %Ecto.Changeset{}} = Chat.update_chat_message(chat_message, @invalid_attrs)
      assert chat_message == Chat.get_chat_message!(chat_message.id)
    end

    test "delete_chat_message/1 deletes the chat_message" do
      chat_message = chat_message_fixture()
      assert {:ok, %ChatMessage{}} = Chat.delete_chat_message(chat_message)
      assert_raise Ecto.NoResultsError, fn -> Chat.get_chat_message!(chat_message.id) end
    end

    test "change_chat_message/1 returns a chat_message changeset" do
      chat_message = chat_message_fixture()
      assert %Ecto.Changeset{} = Chat.change_chat_message(chat_message)
    end
  end

  describe "chatrooms" do
    alias Locallity002.Chat.ChatRoom

    @valid_attrs %{type: 42}
    @update_attrs %{type: 43}
    @invalid_attrs %{type: nil}

    def chat_room_fixture(attrs \\ %{}) do
      {:ok, chat_room} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Chat.create_chat_room()

      chat_room
    end

    test "list_chatrooms/0 returns all chatrooms" do
      chat_room = chat_room_fixture()
      assert Chat.list_chatrooms() == [chat_room]
    end

    test "get_chat_room!/1 returns the chat_room with given id" do
      chat_room = chat_room_fixture()
      assert Chat.get_chat_room!(chat_room.id) == chat_room
    end

    test "create_chat_room/1 with valid data creates a chat_room" do
      assert {:ok, %ChatRoom{} = chat_room} = Chat.create_chat_room(@valid_attrs)
      assert chat_room.type == 42
    end

    test "create_chat_room/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Chat.create_chat_room(@invalid_attrs)
    end

    test "update_chat_room/2 with valid data updates the chat_room" do
      chat_room = chat_room_fixture()
      assert {:ok, %ChatRoom{} = chat_room} = Chat.update_chat_room(chat_room, @update_attrs)
      assert chat_room.type == 43
    end

    test "update_chat_room/2 with invalid data returns error changeset" do
      chat_room = chat_room_fixture()
      assert {:error, %Ecto.Changeset{}} = Chat.update_chat_room(chat_room, @invalid_attrs)
      assert chat_room == Chat.get_chat_room!(chat_room.id)
    end

    test "delete_chat_room/1 deletes the chat_room" do
      chat_room = chat_room_fixture()
      assert {:ok, %ChatRoom{}} = Chat.delete_chat_room(chat_room)
      assert_raise Ecto.NoResultsError, fn -> Chat.get_chat_room!(chat_room.id) end
    end

    test "change_chat_room/1 returns a chat_room changeset" do
      chat_room = chat_room_fixture()
      assert %Ecto.Changeset{} = Chat.change_chat_room(chat_room)
    end
  end

  describe "chatmessages" do
    alias Locallity002.Chat.ChatRoom_Messages

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def chat_room__messages_fixture(attrs \\ %{}) do
      {:ok, chat_room__messages} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Chat.create_chat_room__messages()

      chat_room__messages
    end

    test "list_chatmessages/0 returns all chatmessages" do
      chat_room__messages = chat_room__messages_fixture()
      assert Chat.list_chatmessages() == [chat_room__messages]
    end

    test "get_chat_room__messages!/1 returns the chat_room__messages with given id" do
      chat_room__messages = chat_room__messages_fixture()
      assert Chat.get_chat_room__messages!(chat_room__messages.id) == chat_room__messages
    end

    test "create_chat_room__messages/1 with valid data creates a chat_room__messages" do
      assert {:ok, %ChatRoom_Messages{} = chat_room__messages} = Chat.create_chat_room__messages(@valid_attrs)
    end

    test "create_chat_room__messages/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Chat.create_chat_room__messages(@invalid_attrs)
    end

    test "update_chat_room__messages/2 with valid data updates the chat_room__messages" do
      chat_room__messages = chat_room__messages_fixture()
      assert {:ok, %ChatRoom_Messages{} = chat_room__messages} = Chat.update_chat_room__messages(chat_room__messages, @update_attrs)
    end

    test "update_chat_room__messages/2 with invalid data returns error changeset" do
      chat_room__messages = chat_room__messages_fixture()
      assert {:error, %Ecto.Changeset{}} = Chat.update_chat_room__messages(chat_room__messages, @invalid_attrs)
      assert chat_room__messages == Chat.get_chat_room__messages!(chat_room__messages.id)
    end

    test "delete_chat_room__messages/1 deletes the chat_room__messages" do
      chat_room__messages = chat_room__messages_fixture()
      assert {:ok, %ChatRoom_Messages{}} = Chat.delete_chat_room__messages(chat_room__messages)
      assert_raise Ecto.NoResultsError, fn -> Chat.get_chat_room__messages!(chat_room__messages.id) end
    end

    test "change_chat_room__messages/1 returns a chat_room__messages changeset" do
      chat_room__messages = chat_room__messages_fixture()
      assert %Ecto.Changeset{} = Chat.change_chat_room__messages(chat_room__messages)
    end
  end
end
