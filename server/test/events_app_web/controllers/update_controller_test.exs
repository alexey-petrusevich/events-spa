defmodule EventsAppWeb.UpdateControllerTest do
  use EventsAppWeb.ConnCase

  alias EventsApp.Updates
  alias EventsApp.Updates.Update

  @create_attrs %{
    update: "some update"
  }
  @update_attrs %{
    update: "some updated update"
  }
  @invalid_attrs %{update: nil}

  def fixture(:update) do
    {:ok, update} = Updates.create_update(@create_attrs)
    update
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all updates", %{conn: conn} do
      conn = get(conn, Routes.update_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create update" do
    test "renders update when data is valid", %{conn: conn} do
      conn = post(conn, Routes.update_path(conn, :create), update: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.update_path(conn, :show, id))

      assert %{
               "id" => id,
               "update" => "some update"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.update_path(conn, :create), update: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update update" do
    setup [:create_update]

    test "renders update when data is valid", %{conn: conn, update: %Update{id: id} = update} do
      conn = put(conn, Routes.update_path(conn, :update, update), update: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.update_path(conn, :show, id))

      assert %{
               "id" => id,
               "update" => "some updated update"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, update: update} do
      conn = put(conn, Routes.update_path(conn, :update, update), update: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete update" do
    setup [:create_update]

    test "deletes chosen update", %{conn: conn, update: update} do
      conn = delete(conn, Routes.update_path(conn, :delete, update))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.update_path(conn, :show, update))
      end
    end
  end

  defp create_update(_) do
    update = fixture(:update)
    %{update: update}
  end
end
