defmodule EventsApp.Comments.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "comments" do
    field :comment, :string
    belongs_to :user, EventsApp.Users.User
    belongs_to :event, EventsApp.Events.Event

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:comment, :user_id, :event_id])
    |> validate_required([:comment, :user_id, :event_id])
  end
end
