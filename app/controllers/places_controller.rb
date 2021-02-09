class PlacesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_place, only: %i[ show edit update destroy ]

  # GET /places or /places.json
  def index
    @places = case params[:selection]
              when 'my_places'
                current_user.places
              when 'places_shared_with_me'
                current_user.places_shared_with
              else
                Place
              end.paginate(page: params[:page])
  end

  # GET /places/1 or /places/1.json
  def show
  end

  # GET /places/new
  def new
    @place = current_user.places.new
  end

  # GET /places/1/edit
  def edit
  end

  # POST /places or /places.json
  def create
    share_emails = params[:place].delete :shared_users
    @place = current_user.places.new(place_params)

    respond_to do |format|
      if @place.save_with_share(share_emails)
        format.html { redirect_to @place, notice: "Place was successfully created." }
        format.json { render :show, status: :created, location: @place }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /places/1 or /places/1.json
  def update
    respond_to do |format|
      if @place.update(place_params)
        format.html { redirect_to @place, notice: "Place was successfully updated." }
        format.json { render :show, status: :ok, location: @place }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /places/1 or /places/1.json
  def destroy
    @place.destroy
    respond_to do |format|
      format.html { redirect_to places_url, notice: "Place was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = Place.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def place_params
      params.require(:place).permit(:name, :note, :lat, :lng, :user_id, :public, :selection, shared_users: [])
    end
end
