# ┌─────────────────────────────────────────────────────────────────┐
# │ Inspired by the course "Elixir for Programmers" by Dave Thomas. │
# └─────────────────────────────────────────────────────────────────┘
defmodule Islands.Client.React do
  @moduledoc """
  Reacts to a game state in the _Game of Islands_.

  ##### Inspired by the course [Elixir for Programmers](https://codestool.coding-gnome.com/courses/elixir-for-programmers) by Dave Thomas.
  """

  alias __MODULE__.{Initialized, Player1Turn, Player2Turn, PlayersSet}
  alias Islands.Client.{GameOver, State}
  alias Islands.State, as: StateMachine

  @doc """
  Reacts to a game state.
  """
  # :initialized, :players_set, :player1_turn, :player2_turn, :game_over
  @spec react_to(State.t(), StateMachine.game_state()) :: State.t() | no_return
  def react_to(state, game_state)
  def react_to(state, :initialized), do: Initialized.wait(state)
  def react_to(state, :players_set), do: PlayersSet.maybe_wait(state)
  def react_to(state, :player1_turn), do: Player1Turn.maybe_wait(state)
  def react_to(state, :player2_turn), do: Player2Turn.maybe_wait(state)
  def react_to(state, :game_over), do: GameOver.exit(state)
end
