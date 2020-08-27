class ChoresController < ApplicationController
  def index
    @chores = Chore.all
  end
end
