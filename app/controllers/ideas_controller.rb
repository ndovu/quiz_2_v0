class IdeasController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_idea, only: [:show, :edit, :update, :destroy]

  IDEAS_PER_PAGE = 15

  def index
    @ideas = Idea.page(params[:page]).per(IDEAS_PER_PAGE)
  end

  def new
    @idea = Idea.new
  end

  def edit
  end

  def create
    @idea = current_user.ideas.new(idea_params)
    if @idea.save
      flash[:notice] = "Idea Created Successfully!"
      redirect_to idea_path(@idea)
    else
      render :new
    end
  end

  def show
  end

  def update
    if @idea.update(idea_params)
      # redirect_to question_path(@question)
      redirect_to @idea, notice: "Idea updated successfully!"
    else
      flash[:alert] = "Please correct errors below"
      render :edit
    end
  end

  def destroy
    @idea.destroy
    redirect_to ideass_path, notice: "Question deleted successfully!"
  end



  # =================================
  private

  def idea_params
    params.require(:idea).permit(:title, :body)
  end

  def find_idea
    @idea = Idea.find(params[:id])
  end


end
