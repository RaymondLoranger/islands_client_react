defmodule Islands.Client.React.PlayersSet do
  alias Islands.Client.{State, Summary, Wait}
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
    state
    |> Summary.display()
    |> Wait.wait_for(
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
    state
    |> Summary.display()
    |> Wait.wait_for(
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
