class SongsController < ApplicationController

  def show
    get_song
  end
  
  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      flash[:success] = "Create success"
      redirect_to @song
    else
      flash[:errors] = "Create Failed"
      render :new
    end
  end

  def edit
    get_song
  end

  def update
    get_song
    if @song.update(song_params)
      flash[:success] = "Update success"
      redirect_to song_path(@song)
    else
      flash[:errors] = "Update failed"
      render :edit
    end
  end

  def destroy
    get_song
    @song.destroy
    flash[:success] = "Delete success"
    redirect_to songs_path
  end

  private

  def get_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end
end
