# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Usr.create(name: 'Guest', :password => "abc123", :password_confirmation => "abc123")
# Useful syntax for the console to change the pass:
# usr = Usr.find 1
# usr.password_confirmation = usr.password = 'xyz321'
# usr.save
# Sometimes the above call to usr.save will hang if someone else is connected to the db or the app.
