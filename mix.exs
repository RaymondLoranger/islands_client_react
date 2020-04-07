defmodule Islands.Client.React.MixProject do
  use Mix.Project

  def project do
    [
      app: :islands_client_react,
      version: "0.1.12",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      name: "Islands Client React",
      source_url: source_url(),
      description: description(),
      package: package(),
      deps: deps()
    ]
  end

  defp source_url do
    "https://github.com/RaymondLoranger/islands_client_react"
  end

  defp description do
    """
    Reacts to a game state in the Game of Islands.
    """
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README*", "config/persist*.exs"],
      maintainers: ["Raymond Loranger"],
      licenses: ["MIT"],
      links: %{"GitHub" => source_url()}
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:mix_tasks,
       github: "RaymondLoranger/mix_tasks", only: :dev, runtime: false},
      {:persist_config, "~> 0.2", runtime: false},
      {:islands_score, "~> 0.1"},
      {:islands_state, "~> 0.1"},
      {:islands_tally, "~> 0.1"},
      {:islands_client_game_over, "~> 0.1"},
      {:islands_client_state, "~> 0.1"},
      {:islands_client_summary, "~> 0.1"},
      {:islands_client_wait, "~> 0.1"},
      {:earmark, "~> 1.0", only: :dev},
      {:ex_doc, "~> 0.14", only: :dev, runtime: false},
      {:dialyxir, "~> 0.5", only: :dev, runtime: false}
    ]
  end
end
