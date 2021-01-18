defmodule Islands.Client.React.PlayersSet do
  alias Islands.Client.{State, Wait}
  alias Islands.{Score, Tally}

  @spec maybe_wait(State.t()) :: State.t()
  def maybe_wait(
        %State{
          player_id: :player1,
          tally: %Tally{
            player1_state: :islands_set,
            guesses_score: %Score{gender: gender}
          }
        } = state
      ) do
    :ok = Tally.summary(state.tally, state.player_id)

    Wait.wait_for(
      state,
      :player1_turn,
      "please wait for your opponent to set #{what(gender)} islands"
    )
  end

  def maybe_wait(
        %State{
          player_id: :player2,
          tally: %Tally{
            player2_state: :islands_set,
            guesses_score: %Score{gender: gender}
          }
        } = state
      ) do
    :ok = Tally.summary(state.tally, state.player_id)

    Wait.wait_for(
      state,
      :player2_turn,
      "please wait for your opponent to set #{what(gender)} islands and play"
    )
  end

  def maybe_wait(%State{} = state), do: state

  ## Private functions

  @spec what(atom) :: String.t()
  defp what(:f), do: "her"
  defp what(:m), do: "his"
end
