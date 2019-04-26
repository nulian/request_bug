defmodule NewPhoenixWeb.ErrorView do
  use NewPhoenixWeb, :view

  @spec render(String.t(), map) :: String.t() | map
  def render("401.html", _assigns) do
    "Access denied"
  end

  def render("404.html", %{message: message}) do
    message || "Resource is not found"
  end

  def render("422.html", %{message: message}) do
    message || "Unable to process requested entity"
  end

  def render("500.html", _assigns) do
    "We are sorry but some error occurred which prevents us from completing this request"
  end

  def render(<<status_code::binary-size(3), ".json">>, assigns) when status_code in ["401", "404", "422", "500"] do
    %{
      status: String.to_integer(status_code),
      message: render("#{status_code}.html", assigns)
    }
  end

  def render(template, %{reason: reason}) do
    render(template, reason)
  end

  # In case no render clause matches or no
  # template is found, let's render it as 500
  @spec template_not_found(String.t(), map) :: String.t() | map
  def template_not_found(_template, assigns) do
    render("500.html", assigns)
  end
end
