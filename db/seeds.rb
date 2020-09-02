# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"

puts "Cleaning database..."
Chore.destroy_all
TeamTask.destroy_all
Task.destroy_all

User.destroy_all
Team.destroy_all

puts "Creating tasks.."

# tasks cuisine
# repas_midi = Task.create!(title:"Faire les repas du midi", intensity: 3, room: "Cuisine", frequency:"weekly")
# repas_soir = Task.create!(title:"Faire les repas du soir", intensity: 3, room: "Cuisine", frequency:"weekly")
# courses = Task.create!(title:"Faire les courses", intensity: 3, room: "Cuisine", frequency:"weekly")
vaisselle = Task.create!(title:"Vaisselle à la main", intensity: 3, room: "Cuisine", frequency:"weekly")
lave_vaisselle = Task.create!(title:"Vider/Remplir le lave vaisselle", intensity: 1, room: "Cuisine", frequency:"weekly")
evier = Task.create!(title:"Nettoyer l'évier", intensity: 2, room: "Cuisine", frequency:"weekly")
aspirateur_cuisine = Task.create!(title:"Passer l'aspirateur", intensity: 2, room: "Cuisine", frequency:"weekly")
lavage_cuisine = Task.create!(title:"Passer la serpillère", intensity: 3, room: "Cuisine", frequency:"monthly")

puts "Tasks cuisine finished!"


# tasks salon
aspirateur_salon = Task.create!(title:"Passer l'aspirateur", intensity: 2, room: "Salon", frequency:"weekly")
lavage_salon = Task.create!(title:"Passer la serpillère", intensity: 3, room: "Salon", frequency:"monthly")
poussiere = Task.create!(title:"Faire la poussière", intensity: 2, room: "Salon", frequency:"weekly")
laver_vitres = Task.create!(title:"Faires les vitres", intensity: 1, room: "Salon", frequency:"monthly")
puts "Tasks salon finished!"


# tasks salle de bain
aspirateur_bain = Task.create!(title:"Passer l'aspirateur", intensity: 2, room: "Salle de Bain", frequency:"weekly")
lavage_bain = Task.create!(title:"Passer la serpillère", intensity: 3, room: "Salle de Bain", frequency:"monthly")
nettoyage_bain = Task.create!(title:"Nettoyer la douche", intensity: 3, room: "Salle de Bain", frequency:"monthly")
nettoyage_joint = Task.create!(title:"Vider le syphon", intensity: 3, room: "Salle de Bain", frequency:"weekly")
puts "Tasks salle de bain finished!"


# tasks toilettes
aspirateur_toilettes = Task.create!(title:"Passer l'aspirateur", intensity: 2, room: "Toilette", frequency:"weekly")
lavage_toilettes = Task.create!(title:"Passer la serpillère", intensity: 3, room: "Toilette", frequency:"monthly")
nettoyage_toilettes = Task.create!(title:"Nettoyer les toilettes", intensity: 3, room: "Toilette", frequency:"monthly")
acheter_papier = Task.create!(title:"Acheter du papier toilettes", intensity: 2, room: "Toilette", frequency:"weekly")

puts "Tasks toilettes finished!"


# tasks exterieur
jardin = Task.create!(title:"S'occuper du Potager", intensity: 1, room: "Exterieur", frequency:"weekly")
terasse = Task.create!(title:"Balayer la terasse", intensity: 2, room: "Exterieur", frequency:"weekly")
mobilier = Task.create!(title:"Nettoyer le mobilier", intensity: 2, room: "Exterieur", frequency:"weekly")
compost = Task.create!(title:"Gérer le compost", intensity: 1, room: "Exterieur", frequency:"monthly")
puts "Tasks extérieur creation finished!"

# tasks autres pieces
maintenance = Task.create!(title:"Maintenance générale", intensity: 2, room: "Autres", frequency:"monthly")
chat = Task.create!(title:"Laver la caisse du chat", intensity: 2, room: "Autres", frequency:"weekly")
garage = Task.create!(title:"Vider le verre", intensity: 3, room: "Autres", frequency:"weekly")
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
