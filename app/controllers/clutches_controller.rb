class ClutchesController < ApplicationController
  before_action :set_clutch, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :admin_user, only: [:approve_clutch, :start_hatching]

  # GET /clutches
  # GET /clutches.json
  def index
    @clutches = Clutch.display
  end

  # GET /clutches/1
  # GET /clutches/1.json
  def show
  end

  # GET /clutches/new
  def new
    @clutch = Clutch.new
  end

  # GET /clutches/1/edit
  def edit
  end

  # POST /clutches
  # POST /clutches.json
  def create
    @clutch = Clutch.new(clutch_params)
    @clutch.user_id = current_user.id
    if @clutch.save
      redirect_to @clutch, notice: 'Clutch was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /clutches/1
  # PATCH/PUT /clutches/1.json
  def update
    if @clutch.update(clutch_params)
      redirect_to @clutch, notice: 'Clutch was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /clutches/1
  # DELETE /clutches/1.json
  def destroy
    @clutch.destroy
    redirect_to clutches_url
  end

  # Allows admit to approve a clutch before it becomes visible on site
  def approve_clutch

  end
  
  # Hatching code
  def start_hatching
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clutch
      @clutch = Clutch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def clutch_params
      params.require(:clutch).permit(:dame, :sire, :dame_color, :sire_color, :creature_type, :date_clutched, :date_hatched, :theme)
    end
end
