defmodule Islands.Client.React.Initialized do
  @moduledoc """
  Reacts to game state `:initialized`.
  """

  alias Islands.Client.{State, Wait}

  @doc """
  Reacts to game state `:initialized`.
  """
  @spec wait(State.t()) :: State.t()
  def wait(%State{player_id: :player1} = state) do
    Wait.wait_for(
      state,
      :players_set,
      "please invite an opponent to join the game"
    )
  end
end
