defmodule Issue116 do
  alias Finch.Response

  def child_spec(_) do
    {Finch,
     name: __MODULE__,
     pools: %{
       application_url() => [size: 100]
     }}
  end

  def applications_response do
    :get
    |> Finch.build(application_url() <> "/v2/apps.json")
    |> Finch.request(__MODULE__)
  end

  def handle_applications_response({:ok, %Response{body: body}}) do
    body
    |> Jason.decode!()
  end

  def list_apps do
    handle_applications_response(applications_response())
  end

  defp application_url do
    Application.get_env(:issue116, :application_url, "https://myapp.com")
  end
end
