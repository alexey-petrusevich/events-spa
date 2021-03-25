defmodule EventsApp.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :name, :string, null: false
      add :date, :utc_datetime, null: false
      add :description, :string, null: false
      add :link, :string, null: false
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:events, [:user_id])
  end
end
