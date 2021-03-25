defmodule EventsApp.Repo.Migrations.CreateResponses do
  use Ecto.Migration

  def change do
    create table(:responses) do
      add :response, :integer, null: false
      add :user_id, references(:users, on_delete: :nothing)
      add :event_id, references(:events, on_delete: :nothing)

      timestamps()
    end

    create index(:responses, [:user_id, :event_id])
    #    create index(:responses, [:user_id])
    #    create index(:responses, [:event_id])
  end
end
