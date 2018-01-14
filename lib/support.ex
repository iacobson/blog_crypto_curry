defmodule Support do
  def exchange_rate(from, to) do
    {:ok, %{body: body}} =
      HTTPoison.get("https://min-api.cryptocompare.com/data/price?fsym=#{from}&tsyms=#{to}")

    {:ok, %{^to => value}} = Poison.decode(body)
    value
  end

  def list_crypto_usd do
    {:ok, %{body: body}} =
      HTTPoison.get(
        "https://min-api.cryptocompare.com/data/pricemulti?fsyms=BTC,ETH,LTC&tsyms=USD"
      )

    {:ok, data} = Poison.decode(body)
    Enum.map(data, &crypto_usd/1)
  end

  defp crypto_usd({crypto, %{"USD" => value}}) do
    {String.to_atom(crypto), value}
  end
end
