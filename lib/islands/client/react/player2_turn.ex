defmodule Islands.Client.React.Player2Turn do
  @moduledoc """
  Reacts to game state `:player2_turn`.
  """

  alias Islands.Client.{State, Wait}
  alias Islands.Tally

  @doc """
  Reacts to game state `:player2_turn`.
  """
  @spec maybe_wait(State.t()) :: State.t()
  def maybe_wait(%State{player_id: :player1} = state) do
    :ok = Tally.summary(state.tally, state.player_id)
    Wait.wait_for(state, :player1_turn, "please wait for your opponent to play")
  end

  def maybe_wait(%State{player_id: :player2} = state), do: state
end
