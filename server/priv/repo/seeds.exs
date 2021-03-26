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

alias EventsApp.Repo
alias EventsApp.Users.User

Repo.insert!(%User{name: "alice", email: "alice@alice", password_hash: ""})
Repo.insert!(%User{name: "bob", email: "bob@bob", password_hash: ""})

Repo.insert!(
  %Event{user_id: alice.id, name: "Pizza!", date: DateTime.utc_now(), description: "Pizza will be served!", link: ""}
);
Repo.insert!(
  %Event{user_id: bob.id, name: "Beer!", date: DateTime.utc_now(), description: "Beer will be served!", link: ""}
);
