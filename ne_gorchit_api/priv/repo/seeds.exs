# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     NeGorchitApi.Repo.insert!(%NeGorchitApi.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

# alias NeGorchitApi.Restaurant.Post{Repo, Post}
# %App.Items.Item{name: "we are the world"}
NeGorchitApi.Repo.insert!(%NeGorchitApi.Restaurant.Post{title: "My first post", body: "It works!"})

NeGorchitApi.Repo.insert!(%NeGorchitApi.Restaurant.Post{title: "My first post", body: "It works!"})

NeGorchitApi.Repo.insert!(%NeGorchitApi.Restaurant.Post{title: "My first post", body: "It works!"})
