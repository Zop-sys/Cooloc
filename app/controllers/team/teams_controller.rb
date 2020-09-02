class Team::TeamsController < ApplicationController
  def index
    @team = current_user.team
  end
end

# Classement
# On attribue des points à chaque user :
