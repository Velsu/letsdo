class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update, :destroy]
  require "net/http"
  require "uri"
  require "json"
  
  
 
  
  
  # GET /places
  # GET /places.json
  def index
    @places = Place.all
    if user_signed_in? == true 
      @adult_count = current_user.adult
    end
    
   
    
  end
  
  def pending
    @places = Place.all
  end

  # GET /places/1
  # GET /places/1.json
  def show
     #Get Directions
    
    uri = URI.parse("https://maps.googleapis.com/maps/api/directions/json?units=imperial&origin=33317&destination=miami,fl&key=AIzaSyAhvCRuzyRnVMc4kCahnEJ8XynbnJTTMTw")

    response = Net::HTTP.get_response(uri)
  
    data = JSON.parse(response.body)
    distance = data['routes'][0]['legs'][0]['distance']['text']
    @distance = distance
    t_time = data['routes'][0]['legs'][0]['duration']['text']
    @t_time = t_time
  end
  

  # GET /places/new
  def new
    @place = Place.new
  end

  # GET /places/1/edit
  def edit
  end

  # POST /places
  # POST /places.json
  def create
    @place = Place.new(place_params)

    respond_to do |format|
      if @place.save
        format.html { redirect_to @place, notice: 'Place was successfully created.' }
        format.json { render :show, status: :created, location: @place }
      else
        format.html { render :new }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /places/1
  # PATCH/PUT /places/1.json
  def update
    
    respond_to do |format|
      if @place.update(place_params)
        format.html { redirect_to @place, notice: 'Place was successfully updated.' }
        format.json { render :show, status: :ok, location: @place }
      else
        format.html { render :edit }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /places/1
  # DELETE /places/1.json
  def destroy
    @place.destroy
    respond_to do |format|
      format.html { redirect_to places_url, notice: 'Place was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = Place.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def place_params
      params.require(:place).permit(:title, :s_description, :l_description, :cost, :address, :phone, :outdoor, :website, :picture, :min_age, :verified, :l_time, :op_hours, :image)
    end
end
