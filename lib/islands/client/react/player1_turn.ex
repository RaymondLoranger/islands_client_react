defmodule Islands.Client.React.Player1Turn do
  alias Islands.Client.{State, Wait}
  alias Islands.Tally

  @spec maybe_wait(State.t()) :: State.t()
  def maybe_wait(%State{player_id: :player2} = state) do
    :ok = Tally.summary(state.tally, state.player_id)
    Wait.wait_for(state, :player2_turn, "please wait for your opponent to play")
  end

  def maybe_wait(%State{player_id: :player1} = state), do: state
end
