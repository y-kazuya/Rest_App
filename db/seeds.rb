# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

%W[月曜日 火曜日 水曜日 木曜日 金曜日 土曜日 日曜日 祝日].each { |a| Holiday.create(holi: a) }