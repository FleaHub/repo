class TeamsController < ApplicationController


  before_filter :signed_in_user, only: [:show, :edit, :update, :index, :destroy]
  before_filter :correct_user, only: [:edit, :update]
  # GET /teams
  # GET /teams.json
  def index

    @check_user = current_user.id
    @teams = Team.all
    if params[:search]
      @search = User.search(params[:search]).order("created_at DESC")
    else
      @search = User.order("created_at DESC")
    end

    #@search = User.search(params[:search])



    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @teams }
    end
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
   @check_user= current_user.id
   @team = Team.find(params[:id])



    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @team }
    end
  end

  # GET /teams/new
  # GET /teams/new.json
  def new

    @team = Team.new
3.times do
  @team.players.build
end





    respond_to do |format|
      format.html # new.html.erb
      format.js { render json: @team }
    end
  end

  # GET /teams/1/edit
  def edit
    @check_user= current_user.id
    @team = Team.find(params[:id])
  end

  # POST /teams
  # POST /teams.json
  def create

   @team = Team.new(params[:team])
    if @team.user_id.nil?
      @team.user_id=current_user.id
    end
   else


    respond_to do |format|
      if @team.save
        format.html { redirect_to @team, notice: 'Team was successfully created.' }
        format.json { render json: @team, status: :created, location: @team }
      else
        format.html { render action: "new" }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /teams/1
  # PUT /teams/1.json
  def update
    @team = Team.find(params[:id])

    respond_to do |format|
      if @team.update_attributes(params[:team])
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team = Team.find(params[:id])
    @team.destroy

    respond_to do |format|
      format.html { redirect_to teams_url }
      format.json { head :no_content }
    end
  end

  def correct_user
    # init the user object to be used in the edit and update actions
    @user = current_user
    redirect_to root_path unless current_user?(@user) # the current_user?(user) method is defined in the SessionsHelper
  end




end
