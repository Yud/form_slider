class SemanticsController < ApplicationController
  # GET /films
  def index
    @films = Film.all
  end

  # GET /films/1
  def show
    @film = Film.find(params[:id])
  end

  # GET /films/new
  def new
    @film = Film.new
  end

  # GET /films/1/edit
  def edit
    @film = Film.find(params[:id])
  end

  # POST /films
  def create
    @film = Film.new(params[:film])

    if @film.save
      redirect_to semantic_path(@film), notice: "Film was successfully created. #{params[:tickets]} tickets were ordered."
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /films/1
  def update
    @film = Film.find(params[:id])
    if @film.update_attributes(params[:film])
      redirect_to semantic_path(@film), notice: 'Film was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /films/1
  def destroy
    @film = Film.find(params[:id])
    @film.destroy
    redirect_to semantics_url, notice: 'Film was successfully destroyed.'
  end
end
