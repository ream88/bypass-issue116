defmodule Issue116Test do
  use ExUnit.Case, async: true

  setup do
    bypass = Bypass.open()
    Application.put_env(:issue116, :application_url, "http://localhost:#{bypass.port}")

    _pid = start_supervised!(Issue116)

    {:ok, bypass: bypass}
  end

  describe "list_apps" do
    test "should have an expected app", %{bypass: bypass} do
      {:ok, contents} = File.read("test/apps.json")

      Bypass.expect(
        bypass,
        fn conn ->
          Plug.Conn.resp(conn, 200, contents)
        end
      )

      list_apps = Issue116.list_apps()
      assert length(list_apps) == 57
    end
  end
end
