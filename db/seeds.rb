# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# tasks cuisine
repas_midi = Task.create!(title:"Faire les repas du midi", intensity: 3, room: "Cuisine", frequency:"Hebdomadaire")
repas_soir = Task.create!(title:"Faire les repas du soir", intensity: 3, room: "Cuisine", frequency:"Hebdomadaire")
courses = Task.create!(title:"Faire les courses", intensity: 3, room: "Cuisine", frequency:"Hebdomadaire")
vaisselle = Task.create!(title:"Faire la vaisselle", intensity: 5, room: "Cuisine", frequency:"Hebdomadaire")
lave_vaisselle = Task.create!(title:"Remplir et vider le lave-vaisselle", intensity: 1, room: "Cuisine", frequency:"Hebdomadaire")
evier = Task.create!(title:"Nettoyer les éviers, tables et plans de travail", intensity: 2, room: "Cuisine", frequency:"Hebdomadaire")
aspirateur_cuisine = Task.create!(title:"Passer l'aspirateur", intensity: 2, room: "Cuisine", frequency:"Hebdomadaire")
lavage_cuisine = Task.create!(title:"Passer la serplière", intensity: 3, room: "Cuisine", frequency:"Bi-Hebdomadaire")

# tasks salon
aspirateur_salon = Task.create!(title:"Passer l'aspirateur", intensity: 2, room: "Salon", frequency:"Hebdomadaire")
lavage_salon = Task.create!(title:"Passer la serplière", intensity: 3, room: "Salon", frequency:"Bi-Hebdomadaire")
poussiere = Task.create!(title:"Laver la table, faire les poussières", intensity: 2, room: "Salon", frequency:"Hebdomadaire")

# tasks salle de bain
aspirateur_bain = Task.create!(title:"Passer l'aspirateur", intensity: 2, room: "Salle de Bain", frequency:"Hebdomadaire")
lavage_bain = Task.create!(title:"Passer la serplière", intensity: 3, room: "Salle de Bain", frequency:"Bi-Hebdomadaire")
nettoyage_bain = Task.create!(title:"Nettoyer le lavabo et la douche/baignoire", intensity: 4, room: "Salle de Bain", frequency:"Hebdomadaire")

# tasks toilettes
aspirateur_toilettes = Task.create!(title:"Passer l'aspirateur", intensity: 2, room: "Salle de Bain", frequency:"Hebdomadaire")
lavage_toilettes = Task.create!(title:"Passer la serplière", intensity: 3, room: "Salle de Bain", frequency:"Bi-Hebdomadaire")
nettoyage_toilettes = Task.create!(title:"Nettoyer les toilettes", intensity: 4, room: "Salle de Bain", frequency:"Hebdomadaire")

# tasks exterieur
jardin = Task.create!(title:"S'occuper du jardin", intensity: 2, room: "Salle de Bain", frequency:"Hebdomadaire")
terasse = Task.create!(title:"Balayer/Laver la terasse", intensity: 2, room: "Salle de Bain", frequency:"Hebdomadaire")
mobilier = Task.create!(title:"Entretenir le mobilier extérieur", intensity: 2, room: "Salle de Bain", frequency:"Hebdomadaire")

