class ChoresController < ApplicationController
  def index
    @chores = Chore.all
  end

  def planning
    @team = current_user.team
    @team_tasks = TeamTask.where(team_id: @team.id)
    @counter = 0
    @team_tasks.each do |team_task|
      if team_task.frequency == "Mensuel"
        @counter += team_tasks.intensity
      else
        @counter += team_task.intensity * 4
      end
    end
    @users_team = @team.users
    @pointsperweek = @counter / (4 + @users_team.count)


    #Dupliquer les tasks qui sont mensuels
    @mensuel_tasks = TeamTask.where(frequency: "Mensuel")






    @users_team.each do | user|
      # Tant que user a pas w1 = arrondi de points per week / ou alors point pers week arrondi ?
        # on attribu au user une task_team de manière random
        #on ajoute des points au w1
        # on dit que la team_task a été attribué
      #

    end

  end
end






# Récupérer toutes les tasks`-team (de la coloc)
#Retrouver à quelle task ça correspond (pour avoir toutes les chractéritiques)
    # La logique de planning
      # En fonction de l'intensité de la tache : 1 / 2 / 3
      # En fonction du nombre de user : cque personne doit avoir la même dureté de planning
      # En fonction de la fréquence de la taches
      # Répartie sur 4 semaines

# On calcule le nombre de points total pour le mois ( nombre de tasks_team * intensité (* fréquence ??? )
  Si hebdomadaire
  Si mensuel

# On divise ces tasks par le nombre de user (pour avoir le nombre de points à assigner à chaque personne )





