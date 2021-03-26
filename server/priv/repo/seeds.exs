# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     EventsApp.Repo.insert!(%EventsApp.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

# BASED ON LECTURE NOTES OF PROFESSOR NAT TUCK


alias EventsApp.Repo
alias EventsApp.Users.User
alias EventsApp.Events.Event

defmodule Inject do
  def user(name, pass, email) do
    hash = Argon2.hash_pwd_salt(pass)
    Repo.insert!(%User{name: name, password_hash: hash, email: email})
  end
end


alice = Inject.user("alice", "test1", "alice@alice")
bob = Inject.user("bob", "test2", "bob@bob")

#alice = Repo.insert!(%User{name: "alice", email: "alice@alice", password_hash: ""})
#bob = Repo.insert!(%User{name: "bob", email: "bob@bob", password_hash: ""})

Repo.insert!(
  %Event{
    user_id: alice.id,
    name: "Pizza!",
    date: DateTime.utc_now()
          |> DateTime.truncate(:second),
    description: "Pizza will be served!",
    link: ""
  }
);
Repo.insert!(
  %Event{
    user_id: bob.id,
    name: "Beer!",
    date: DateTime.utc_now()
          |> DateTime.truncate(:second),
    description: "Beer will be served!",
    link: ""
  }
);
