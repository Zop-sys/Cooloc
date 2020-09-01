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
vaisselle = Task.create!(title:"Vaisselle à la main", intensity: 5, room: "Cuisine", frequency:"weekly")
lave_vaisselle = Task.create!(title:"Lave-vaisselle", intensity: 1, room: "Cuisine", frequency:"weekly")
evier = Task.create!(title:"Evier et tables", intensity: 2, room: "Cuisine", frequency:"weekly")
aspirateur_cuisine = Task.create!(title:"Aspirateur", intensity: 2, room: "Cuisine", frequency:"weekly")
lavage_cuisine = Task.create!(title:"Serpillère", intensity: 3, room: "Cuisine", frequency:"monthly")

puts "Tasks cuisine finished!"


# tasks salon
aspirateur_salon = Task.create!(title:"Aspirateur", intensity: 2, room: "Salon", frequency:"weekly")
lavage_salon = Task.create!(title:"Serpillère", intensity: 3, room: "Salon", frequency:"monthly")
poussiere = Task.create!(title:"Poussières", intensity: 2, room: "Salon", frequency:"weekly")
laver_vitres = Task.create!(title:"Vitres", intensity: 1, room: "Salon", frequency:"monthly")
changer_ampoules = Task.create!(title:"Ampoules", intensity: 3, room: "Salon", frequency:"monthly")
puts "Tasks salon finished!"


# tasks salle de bain
aspirateur_bain = Task.create!(title:"Aspirateur", intensity: 2, room: "Salle de Bain", frequency:"weekly")
lavage_bain = Task.create!(title:"Serpillère", intensity: 3, room: "Salle de Bain", frequency:"monthly")
nettoyage_bain = Task.create!(title:"Douche", intensity: 3, room: "Salle de Bain", frequency:"monthly")
nettoyage_joint = Task.create!(title:"Joint", intensity: 1, room: "Salle de Bain", frequency:"weekly")
acheter_savon = Task.create!(title:"Savon", intensity: 2, room: "Salle de Bain", frequency:"monthly")
puts "Tasks salle de bain finished!"


# tasks toilettes
aspirateur_toilettes = Task.create!(title:"Passer l'aspirateur", intensity: 2, room: "Toilette", frequency:"weekly")
lavage_toilettes = Task.create!(title:"Passer la serpillère", intensity: 3, room: "Toilette", frequency:"monthly")
nettoyage_toilettes = Task.create!(title:"Nettoyage", intensity: 3, room: "Toilette", frequency:"monthly")
acheter_papier = Task.create!(title:"Papier", intensity: 2, room: "Toilette", frequency:"weekly")

puts "Tasks toilettes finished!"


# tasks exterieur
jardin = Task.create!(title:"Jardin", intensity: 1, room: "Exterieur", frequency:"weekly")
terasse = Task.create!(title:"Balayer", intensity: 2, room: "Exterieur", frequency:"weekly")
mobilier = Task.create!(title:"Mobilier", intensity: 2, room: "Exterieur", frequency:"weekly")
potager = Task.create!(title:"Potager", intensity: 3, room: "Exterieur", frequency:"monthly")
arbre = Task.create!(title:"Arbre", intensity: 1, room: "Exterieur", frequency:"monthly")
puts "Tasks extérieur creation finished!"

# tasks autres pieces
maintenance = Task.create!(title:"Maintenance", intensity: 2, room: "Autres", frequency:"monthly")
animaux = Task.create!(title:"Animaux", intensity: 2, room: "Autres", frequency:"weekly")
compost = Task.create!(title:"Compost", intensity: 1, room: "Autres", frequency:"monthly")
garage = Task.create!(title:"Garage", intensity: 3, room: "Autres", frequency:"weekly")
grenier = Task.create!(title:"Grenier", intensity: 1, room: "Autres", frequency:"weekly")
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
