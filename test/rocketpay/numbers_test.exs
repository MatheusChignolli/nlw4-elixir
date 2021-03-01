defmodule Rocketpay.NumbersTest do
  use ExUnit.Case

  alias Rocketpay.Numbers

  describe "sum_from_file/1" do
    test "when there is a file with number, returns the sum of the numbers" do
      {:ok, %{result: result}} = Numbers.sum_from_file("numbers")
      expected_reponse = 37
      assert result == expected_reponse
    end

    test "when there is not a file with number, returns and error" do
      {:error, %{message: result}} = Numbers.sum_from_file("test")
      expected_reponse = "Invalid file"
      assert result == expected_reponse
    end
  end
end
