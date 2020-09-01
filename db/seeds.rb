# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"

puts "Cleaning database..."
TeamTask.destroy_all
Task.destroy_all
Chore.destroy_all
User.destroy_all
Team.destroy_all

puts "Creating tasks.."

# tasks cuisine
# repas_midi = Task.create!(title:"Faire les repas du midi", intensity: 3, room: "Cuisine", frequency:"weekly")
# repas_soir = Task.create!(title:"Faire les repas du soir", intensity: 3, room: "Cuisine", frequency:"weekly")
# courses = Task.create!(title:"Faire les courses", intensity: 3, room: "Cuisine", frequency:"weekly")
vaisselle = Task.create!(title:"Faire la vaisselle", intensity: 5, room: "Cuisine", frequency:"weekly")
lave_vaisselle = Task.create!(title:"Remplir et vider le lave-vaisselle", intensity: 1, room: "Cuisine", frequency:"weekly")
evier = Task.create!(title:"Nettoyer les éviers, tables et plans de travail", intensity: 2, room: "Cuisine", frequency:"weekly")
aspirateur_cuisine = Task.create!(title:"Passer l'aspirateur", intensity: 2, room: "Cuisine", frequency:"weekly")
lavage_cuisine = Task.create!(title:"Passer la serplière", intensity: 3, room: "Cuisine", frequency:"monthly")

puts "Tasks cuisine finished!"


# tasks salon
aspirateur_salon = Task.create!(title:"Passer l'aspirateur", intensity: 2, room: "Salon", frequency:"weekly")
lavage_salon = Task.create!(title:"Passer la serplière", intensity: 3, room: "Salon", frequency:"monthly")
poussiere = Task.create!(title:"Laver la table, faire les poussières", intensity: 2, room: "Salon", frequency:"weekly")

puts "Tasks salon finished!"


# tasks salle de bain
aspirateur_bain = Task.create!(title:"Passer l'aspirateur", intensity: 2, room: "Salle de Bain", frequency:"weekly")
lavage_bain = Task.create!(title:"Passer la serplière", intensity: 3, room: "Salle de Bain", frequency:"monthly")
nettoyage_bain = Task.create!(title:"Nettoyer le lavabo et la douche/baignoire", intensity: 3, room: "Salle de Bain", frequency:"monthly")

puts "Tasks salle de bain finished!"


# tasks toilettes
aspirateur_toilettes = Task.create!(title:"Passer l'aspirateur", intensity: 2, room: "Toilette", frequency:"weekly")
lavage_toilettes = Task.create!(title:"Passer la serplière", intensity: 3, room: "Toilette", frequency:"monthly")
nettoyage_toilettes = Task.create!(title:"Nettoyer les toilettes", intensity: 3, room: "Toilette", frequency:"monthly")

puts "Tasks toilettes finished!"


# tasks exterieur
jardin = Task.create!(title:"S'occuper du jardin", intensity: 1, room: "Exterieur", frequency:"weekly")
terasse = Task.create!(title:"Balayer/Laver la terasse", intensity: 2, room: "Exterieur", frequency:"weekly")
mobilier = Task.create!(title:"Entretenir le mobilier extérieur", intensity: 2, room: "Exterieur", frequency:"weekly")

puts "Tasks extérieur creation finished!"

# tasks autres pieces
maintenance = Task.create!(title:"S'occuper de la maintenance générale", intensity: 2, room: "Autres", frequency:"monthly")
animaux = Task.create!(title:"S'occuper des animaux", intensity: 2, room: "Autres", frequency:"weekly")

puts "Tasks autres pièces creation finished!"

puts "All tasks created"

puts "Creatings teams ..."


# teams

team = Team.create!(name: "Happy Team")
puts "Created #{team.name}"

team = Team.create!(name: "Les coolocs créatifs !")
puts "Created #{team.name}"

puts "All teams created"

# users

user = User.new(pseudo: "Léa", email:"lea@mail.com", password: "password")
user.team = Team.where(name: "Les coolocs créatifs !").first
user.save!
puts "Created #{user.pseudo}"

user = User.new(pseudo: "Léo", email:"leo@mail.com", password: "password")
user.team = Team.where(name: "Les coolocs créatifs !").first
user.save!
puts "Created #{user.pseudo}"

user = User.new(pseudo: "Ava", email:"ava@mail.com", password: "password")
user.team = Team.where(name: "Les coolocs créatifs !").first
user.save!
puts "Created #{user.pseudo}"

puts "All users created"


#chores

# chore = Chore.new
# chore.user = User.where(pseudo: 'Ava').first
# chore.task = Task.where(title: "S'occuper de la maintenance générale").first
# chore.save!
# puts "Created "

# chore = Chore.new
# chore.user = User.where(pseudo: 'Ava').first
# chore.task = Task.where(title: "Balayer/Laver la terasse").first
# chore.save!
# puts "Created "

# chore = Chore.new
# chore.user = User.where(pseudo: 'Ava').first
# chore.task = Task.where(title: "Passer la serplière").first
# chore.save!
# puts "Created "

# chore = Chore.new
# chore.user = User.where(pseudo: 'Ava').first
# chore.task = Task.where(title: "Laver la table, faire les poussières").first
# chore.save!
# puts "Created "

# chore = Chore.new
# chore.user = User.where(pseudo: 'Ava').first
# chore.task = Task.where(title: "S'occuper des animaux").first
# chore.save!
# puts "Created "

# chore = Chore.new
# chore.user = User.where(pseudo: 'Léo').first
# chore.task = Task.where(title: "S'occuper des animaux").first
# chore.save!
# puts "Created "

# chore = Chore.new
# chore.user = User.where(pseudo: 'Léo').first
# chore.task = Task.where(title: "Laver la table, faire les poussières").first
# chore.save!
# puts "Created "
