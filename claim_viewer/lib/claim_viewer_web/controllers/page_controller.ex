defmodule ClaimViewerWeb.PageController do
  use ClaimViewerWeb, :controller
  alias ClaimViewer.Repo
  alias ClaimViewer.Claims.Claim

  # ΑΡΧΙΚΗ ΦΟΡΤΩΣΗ ΣΕΛΙΔΑΣ
  def home(conn, _params) do
    render(conn, :home, json: [], show_claim: false)
  end

  # UPLOAD JSON
  def upload(conn, %{"file" => %Plug.Upload{path: path}}) do
    json =
      path
      |> File.read!()
      |> Jason.decode!()

    %Claim{}
    |> Claim.changeset(%{raw_json: json})
    |> Repo.insert!()

    render(conn, :home, json: json, show_claim: true)
  end

  # UPLOAD ΧΩΡΙΣ ΑΡΧΕΙΟ
  def upload(conn, _params) do
    conn
    |> put_flash(:error, "Please select a JSON file before uploading.")
    |> redirect(to: "/")
  end
end
