defmodule Initial do
  alias Support

  def buy_crypto_with_gbp(amount) do
    Support.list_crypto_usd()
    |> Enum.map(&apply_conversion(Support.exchange_rate("USD", "GBP"), &1))
    |> Enum.map(&get_quantity(&1, amount))
  end

  defp apply_conversion(rate, {crypto, value_usd}) do
    {crypto, value_usd * rate}
  end

  defp get_quantity({crypto, value_gbp}, amount) do
    {crypto, amount / value_gbp}
  end
end
