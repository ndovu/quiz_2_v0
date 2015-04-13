class JoinsController < ApplicationController
before_action :authenticate_user!
  
  def create
    idea = Idea.find params[:idea_id]
    join = current_user.joins.new
    join.idea = idea
    if join.save
      redirect_to idea, notice: "Joined!"
    else
      redirect_to idea, alert: "Not Joined! You may have already joined this idea"
    end  
  end

  def destroy
    join = current_user.joins.find params[:id]
    join.destroy
    redirect_to join.idea, notice: "Un-joined"
  end 
end
