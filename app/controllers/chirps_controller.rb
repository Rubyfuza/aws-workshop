class ChirpsController < ApplicationController
  # GET /chirps
  # GET /chirps.json
  def index
    @chirps = Chirp.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @chirps }
    end
  end

  # GET /chirps/1
  # GET /chirps/1.json
  def show
    @chirp = Chirp.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @chirp }
    end
  end

  # GET /chirps/new
  # GET /chirps/new.json
  def new
    @chirp = Chirp.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @chirp }
    end
  end

  # GET /chirps/1/edit
  def edit
    @chirp = Chirp.find(params[:id])
  end

  # POST /chirps
  # POST /chirps.json
  def create
    @chirp = Chirp.new(params[:chirp])

    respond_to do |format|
      if @chirp.save
        format.html { redirect_to @chirp, notice: 'Chirp was successfully created.' }
        format.json { render json: @chirp, status: :created, location: @chirp }
      else
        format.html { render action: "new" }
        format.json { render json: @chirp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /chirps/1
  # PUT /chirps/1.json
  def update
    @chirp = Chirp.find(params[:id])

    respond_to do |format|
      if @chirp.update_attributes(params[:chirp])
        format.html { redirect_to @chirp, notice: 'Chirp was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @chirp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chirps/1
  # DELETE /chirps/1.json
  def destroy
    @chirp = Chirp.find(params[:id])
    @chirp.destroy

    respond_to do |format|
      format.html { redirect_to chirps_url }
      format.json { head :no_content }
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
