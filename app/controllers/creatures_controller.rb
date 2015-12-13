class CreaturesController < ApplicationController
  
  # display all creatures 
  def index
    # get all creatures from db and save to instance variable
    @creatures = Creature.all

    # render the index view (it has access to instance variable) 
    render :index
    end 

  end

  # show the new creature form
  def new
    @creature = Creature.new
    render :new
  end

  # display a specific creature
  def show
    # get the creature id from the url params
    creature_id = params[:id]
    # use "creature_id" to find the creature in db and save to instance variable
    @creature = Creature.find_by_id(creature_id)

    # render the show view(it has access to instance variable)
    render :show
  end

  def edit
  end

  # show new creature in db
  def create
    # whitelist params and save to a variable
    creature_params = params.require(:creature).permit(:name, :description)

    # create new creature
    creature = Creature.new(creature_params)

    # after saving,redirect to route that displays ONLY the new created creature
    if creature.save
      redirect_to creature_path(creature)
    end 

  end 








