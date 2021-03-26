# BASED ON LECTURE NOTES OF PROFESSOR NAT TUCK
defmodule EventsApp.Events.Event do
  use Ecto.Schema
  import Ecto.Changeset

  schema "events" do
    field :date, :utc_datetime
    field :description, :string
    field :link, :string
    field :name, :string
    belongs_to :user, EventsApp.Users.User
    has_many :comments, EventsApp.Comments.Comment
    has_many :responses, EventsApp.Responses.Response
    has_many :updates, EventsApp.Updates.Update

    timestamps()
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [:name, :description, :link, :user_id])
    |> validate_required([:name, :description, :link, :user_id])
  end
end
