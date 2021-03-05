defmodule FriendState do
  @moduledoc false
  use EctoEnum.Postgres,
      type: :friend_state,
      enums: [
        :friend_request_sent,
        :friend_request_accepted,
        :friend_request_declined,
        :unfriended
      ]
end