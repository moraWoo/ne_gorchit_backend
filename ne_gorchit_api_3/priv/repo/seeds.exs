# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     NeGorchitApi3.Repo.insert!(%NeGorchitApi3.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

NeGorchitApi3.Repo.insert!(%NeGorchitApi3.Restaurant.Menu{
  name: "Гарлики чесночные",
  description:
    "Обжаренные брусочки бородинского хлебушка, смазанные чесночным маслом. Подаются с соусом тар-тар",
  price: 1279.0,
  image: "images/garliki.jpg"
})

NeGorchitApi3.Repo.insert!(%NeGorchitApi3.Restaurant.Menu{
  name: "Кесадилья",
  description:
    "Популярная мексиканская закуска из курицы, овощей и соуса, подается в свежей тартилье",
  price: 3379.0,
  image: "images/kessadilia.jpg"
})

NeGorchitApi3.Repo.insert!(%NeGorchitApi3.Restaurant.Menu{
  name: "Клаб сендвич",
  description:
    "Добротный сендвич с курочкой и овощами на тостерном хлебе, подается с картофелем фри и кетчупом",
  price: 2379.0,
  image: "images/club_sandvich.jpg"
})
