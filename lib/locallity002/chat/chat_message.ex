defmodule Locallity002.Chat.ChatMessage do
  use Ecto.Schema
  import Ecto.Changeset

  schema "messages" do
    field :content, :string
    field :delivered, :boolean, default: false
    field :seen, :boolean, default: false
    field :sender_id, :id

    timestamps()
  end

  @doc false
  def changeset(chat_message, attrs) do
    chat_message
    |> cast(attrs, [:content, :delivered, :seen])
    |> validate_required([:content, :delivered, :seen])
  end
end
