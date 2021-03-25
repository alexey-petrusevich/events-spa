defmodule EventsApp.Updates.Update do
  use Ecto.Schema
  import Ecto.Changeset

  schema "updates" do
    field :update, :string
    belongs_to :user, EventsApp.Users.User
    belongs_to :event, EventsApp.Events.Event

    timestamps()
  end

  @doc false
  def changeset(update, attrs) do
    update
    |> cast(attrs, [:update, :user_id, :event_id])
    |> validate_required([:update, :user_id, :event_id])
  end
end
