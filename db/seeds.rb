# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

FeatureRequest.create!(subject: 'Improve UI', description: 'Right now the UI is a little bland!')
FeatureRequest.create!(subject: 'Move /feature requests route to frontpage', description: 'I am sick of the default view')
FeatureRequest.create!(subject: 'Deploy to Heroku', description: 'What good is it if it is not deployed?')
FeatureRequest.create!(subject: 'Add users', description: 'So we can keep track of who requests what')
