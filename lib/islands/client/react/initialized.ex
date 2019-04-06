defmodule Islands.Client.React.Initialized do
  alias Islands.Client.{State, Wait}

  @spec wait(State.t()) :: State.t()
  def wait(%State{player_id: :player1} = state) do
    Wait.wait_for(
      state,
      :players_set,
      "please invite an opponent to join the game"
    )
  end
end
