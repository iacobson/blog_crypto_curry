defmodule CryptoCurry do
  use Quark
  alias Support

  defx buy_crypto_with_gbp do
    buy_crypto_with_gbp().()
  end

  defcurryp buy_crypto_with_gbp(amount) do
    Enum.map(
      Support.list_crypto_usd(),
      &convert_gbp_and_get_quantity().(&1).(amount)
    )
  end

  defp convert_gbp_and_get_quantity do
    get_quantity() <|> apply_conversion_gbp()
  end

  defp apply_conversion_gbp do
    (apply_conversion() <|> exchange_rate_from_usd()).("GBP")
  end

  defp exchange_rate_from_usd do
    exchange_rate().("USD")
  end

  defcurryp apply_conversion(rate, {crypto, value_usd}) do
    {crypto, value_usd * rate}
  end

  defcurryp get_quantity({crypto, value_gbp}, amount) do
    {crypto, amount / value_gbp}
  end

  defcurryp exchange_rate(from, to) do
    Support.exchange_rate(from, to)
  end
end
