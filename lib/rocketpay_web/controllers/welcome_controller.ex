defmodule RocketpayWeb.WelcomeController do
  use RocketpayWeb, :controller

  alias Rocketpay.Numbers

  def index(conn, %{"filename" => filename}) do
    filename
      |> Numbers.sum_from_file()
      |> handle_reponse(conn)
  end

  defp handle_reponse({:ok, %{result: result}}, conn) do
    conn
    |> put_status(:ok)
    |> json(%{message: "Welcome: #{result}"})
  end

  defp handle_reponse({:error, reason}, conn) do
    conn
    |> put_status(:bad_request)
    |> json(%{message: "Error: #{reason}"})
  end
end
