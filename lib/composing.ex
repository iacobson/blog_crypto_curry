defmodule Composing do
  use Quark.Curry
  import Quark.Compose

  def bazz_rl do
    bar() <|> foo()
  end

  def bazz_lr do
    foo() <~> bar()
  end

  defcurry foo(x) do
    x
  end

  defcurry bar(x, y) do
    x <> " " <> y
  end
end


# the composition order is different, the result is the same
# Composing.bazz_rl.("a").("b") == Composing.bazz_lr.("a").("b")
