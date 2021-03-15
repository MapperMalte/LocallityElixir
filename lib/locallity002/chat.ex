defmodule Locallity002.Chat do
  @moduledoc """
  The Chat context.
  """

  import Ecto.Query, warn: false
  alias Locallity002.Repo

  alias Locallity002.Chat.ChatMessage

  @doc """
  Returns the list of messages.

  ## Examples

      iex> list_messages()
      [%ChatMessage{}, ...]

  """
  def list_messages do
    Repo.all(ChatMessage)
  end

  @doc """
  Gets a single chat_message.

  Raises `Ecto.NoResultsError` if the Chat message does not exist.

  ## Examples

      iex> get_chat_message!(123)
      %ChatMessage{}

      iex> get_chat_message!(456)
      ** (Ecto.NoResultsError)

  """
  def get_chat_message!(id), do: Repo.get!(ChatMessage, id)

  @doc """
  Creates a chat_message.

  ## Examples

      iex> create_chat_message(%{field: value})
      {:ok, %ChatMessage{}}

      iex> create_chat_message(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_chat_message(attrs \\ %{}) do
    %ChatMessage{}
    |> ChatMessage.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a chat_message.

  ## Examples

      iex> update_chat_message(chat_message, %{field: new_value})
      {:ok, %ChatMessage{}}

      iex> update_chat_message(chat_message, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_chat_message(%ChatMessage{} = chat_message, attrs) do
    chat_message
    |> ChatMessage.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a chat_message.

  ## Examples

      iex> delete_chat_message(chat_message)
      {:ok, %ChatMessage{}}

      iex> delete_chat_message(chat_message)
      {:error, %Ecto.Changeset{}}

  """
  def delete_chat_message(%ChatMessage{} = chat_message) do
    Repo.delete(chat_message)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking chat_message changes.

  ## Examples

      iex> change_chat_message(chat_message)
      %Ecto.Changeset{data: %ChatMessage{}}

  """
  def change_chat_message(%ChatMessage{} = chat_message, attrs \\ %{}) do
    ChatMessage.changeset(chat_message, attrs)
  end

  alias Locallity002.Chat.ChatRoom

  @doc """
  Returns the list of chatrooms.

  ## Examples

      iex> list_chatrooms()
      [%ChatRoom{}, ...]

  """
  def list_chatrooms do
    Repo.all(ChatRoom)
  end

  @doc """
  Gets a single chat_room.

  Raises `Ecto.NoResultsError` if the Chat room does not exist.

  ## Examples

      iex> get_chat_room!(123)
      %ChatRoom{}

      iex> get_chat_room!(456)
      ** (Ecto.NoResultsError)

  """
  def get_chat_room!(id), do: Repo.get!(ChatRoom, id)

  @doc """
  Creates a chat_room.

  ## Examples

      iex> create_chat_room(%{field: value})
      {:ok, %ChatRoom{}}

      iex> create_chat_room(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_chat_room(attrs \\ %{}) do
    %ChatRoom{}
    |> ChatRoom.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a chat_room.

  ## Examples

      iex> update_chat_room(chat_room, %{field: new_value})
      {:ok, %ChatRoom{}}

      iex> update_chat_room(chat_room, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_chat_room(%ChatRoom{} = chat_room, attrs) do
    chat_room
    |> ChatRoom.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a chat_room.

  ## Examples

      iex> delete_chat_room(chat_room)
      {:ok, %ChatRoom{}}

      iex> delete_chat_room(chat_room)
      {:error, %Ecto.Changeset{}}

  """
  def delete_chat_room(%ChatRoom{} = chat_room) do
    Repo.delete(chat_room)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking chat_room changes.

  ## Examples

      iex> change_chat_room(chat_room)
      %Ecto.Changeset{data: %ChatRoom{}}

  """
  def change_chat_room(%ChatRoom{} = chat_room, attrs \\ %{}) do
    ChatRoom.changeset(chat_room, attrs)
  end

  alias Locallity002.Chat.ChatRoom_Messages

  @doc """
  Returns the list of chatmessages.

  ## Examples

      iex> list_chatmessages()
      [%ChatRoom_Messages{}, ...]

  """
  def list_chatmessages do
    Repo.all(ChatRoom_Messages)
  end

  @doc """
  Gets a single chat_room__messages.

  Raises `Ecto.NoResultsError` if the Chat room  messages does not exist.

  ## Examples

      iex> get_chat_room__messages!(123)
      %ChatRoom_Messages{}

      iex> get_chat_room__messages!(456)
      ** (Ecto.NoResultsError)

  """
  def get_chat_room__messages!(id), do: Repo.get!(ChatRoom_Messages, id)

  @doc """
  Creates a chat_room__messages.

  ## Examples

      iex> create_chat_room__messages(%{field: value})
      {:ok, %ChatRoom_Messages{}}

      iex> create_chat_room__messages(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_chat_room__messages(attrs \\ %{}) do
    %ChatRoom_Messages{}
    |> ChatRoom_Messages.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a chat_room__messages.

  ## Examples

      iex> update_chat_room__messages(chat_room__messages, %{field: new_value})
      {:ok, %ChatRoom_Messages{}}

      iex> update_chat_room__messages(chat_room__messages, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_chat_room__messages(%ChatRoom_Messages{} = chat_room__messages, attrs) do
    chat_room__messages
    |> ChatRoom_Messages.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a chat_room__messages.

  ## Examples

      iex> delete_chat_room__messages(chat_room__messages)
      {:ok, %ChatRoom_Messages{}}

      iex> delete_chat_room__messages(chat_room__messages)
      {:error, %Ecto.Changeset{}}

  """
  def delete_chat_room__messages(%ChatRoom_Messages{} = chat_room__messages) do
    Repo.delete(chat_room__messages)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking chat_room__messages changes.

  ## Examples

      iex> change_chat_room__messages(chat_room__messages)
      %Ecto.Changeset{data: %ChatRoom_Messages{}}

  """
  def change_chat_room__messages(%ChatRoom_Messages{} = chat_room__messages, attrs \\ %{}) do
    ChatRoom_Messages.changeset(chat_room__messages, attrs)
  end
end
