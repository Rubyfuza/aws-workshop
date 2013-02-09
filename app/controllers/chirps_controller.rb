class ChirpsController < ApplicationController
  # GET /chirps
  # GET /chirps.json
  def index
    @chirps = Chirp.all.reverse

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @chirps }
    end
  end

  def user
    @user = User.find_by_name!(params[:name])
    @chirps = @user.relevant_chirps
  end

  # POST /chirps
  # POST /chirps.json
  def create
    @chirp = ChirpCreationService.new.create(params[:chirp])

    respond_to do |format|
      if @chirp.save
        format.html { redirect_to '/', notice: 'Chirp was successfully created.' }
        format.json { render json: @chirp, status: :created, location: @chirp }
      else
        format.html { render action: "new" }
        format.json { render json: @chirp.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /search
  # GET /search.json
  def search
    @query = params[:query]
    sql = "content LIKE ?"
    @chirps = Chirp.where([sql, "%#{@query}%"])

    respond_to do |format|
      format.html 
      format.json { render json: @chirps }
    end
  end

end
