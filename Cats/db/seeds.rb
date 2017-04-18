# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

r = CatRentalRequest.create(cat_id: 1, start_date: '04/04/2015', end_date: '04/05/2015')
r = CatRentalRequest.create(cat_id: 1, start_date: '06/04/2015', end_date: '20/05/2015')
r = CatRentalRequest.create(cat_id: 1, start_date: '04/07/2015', end_date: '04/08/2015')
