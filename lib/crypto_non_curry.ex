defmodule CryptoNonCurry do
  alias Support

  def buy_crypto_with_gbp(amount) do
    Support.list_crypto_usd()
    |> Enum.map(&convert_gbp_and_get_quantity(&1, amount))
  end

  defp convert_gbp_and_get_quantity(crypto_data, amount) do
    "GBP"
    |> exchange_rate_from_usd()
    |> apply_conversion(crypto_data)
    |> get_quantity(amount)
  end

  defp exchange_rate_from_usd(to) do
    Support.exchange_rate("USD", to)
  end

  defp apply_conversion(rate, {crypto, value_usd}) do
    {crypto, value_usd * rate}
  end

  defp get_quantity({crypto, value_gbp}, amount) do
    {crypto, amount / value_gbp}
  end
end
