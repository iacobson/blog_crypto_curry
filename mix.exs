defmodule BlogCryptoCurry.MixProject do
  use Mix.Project

  def project do
    [
      app: :blog_crypto_curry,
      version: "0.1.0",
      elixir: "~> 1.6-rc",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:quark, "~> 2.2"},
      {:poison, "~> 3.1"},
      {:httpoison, "~> 1.0"}
    ]
  end
end
