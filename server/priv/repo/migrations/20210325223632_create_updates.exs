defmodule EventsApp.Repo.Migrations.CreateUpdates do
  use Ecto.Migration

  def change do
    create table(:updates) do
      add :update, :text, null: false
      add :user_id, references(:users, on_delete: :nothing)
      add :event_id, references(:events, on_delete: :nothing)

      timestamps()
    end

    create index(:updates, [:user_id])
    create index(:updates, [:event_id])
  end
end
