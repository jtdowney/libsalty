defmodule Salty.Mixfile do
  use Mix.Project

  @github "https://github.com/ArteMisc/libsalty"

  def project do
    [
      app: :salty,
      version: "0.1.3",
      elixir: "~> 1.4",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      compilers: [:elixir_make] ++ Mix.compilers(),
      make_clean: ["clean"],
      description: description(),
      package: package(),
      deps: deps(),
      docs: [extras: ["README.md"], main: "readme"],
      source_url: @github
    ]
  end

  # Configuration for the OTP application
  def application do
    [mod: {Salty.Application, []}]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.22.2", only: :dev},
      {:elixir_make, "~> 0.6", runtime: false}
    ]
  end

  defp description do
    """
    An Elixir wrapper around the libsodium cryptographic library.
    Based on erlang-nif.
    """
  end

  defp package do
    [
      name: "libsalty",
      files: ["config", "src", "lib", "mix.exs", "Makefile", "LICENSE*", "README*"],
      maintainers: ["jan@artemisc.eu"],
      licenses: ["Apacha License, Version 2.0"],
      links: %{"Github" => @github}
    ]
  end
end
