# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
bo = User.new
bo.email = "bo@america.com"
bo.password = "America1"
bo.password_confirmation = "America1"
bo.save!

johnny = User.new
johnny.email = "johnny@america.com"
johnny.password = "America1"
johnny.password_confirmation = "America1"
johnny.save!

