require 'pry'
class SongsController < ApplicationController
  def index
    @songs = Song.all

  end

  def show
    @song = Song.find(params[:id])
  end

  def edit
    @song = Song.find(params[:id])

  end

  def update
    @song = Song.find(params[:id])
    @song.update(songs_params)
    # @song.update(songs_params)
    # @new_song = Song.new(songs_params)
    if @song.valid?

      redirect_to @song
    else
      render :edit
    end
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(songs_params)
    if @song.valid?
      @song = Song.create(songs_params)
      redirect_to @song
    else
      render :new
    end
  end

  def destroy
    Song.destroy(params[:id])
    redirect_to songs_path
  end


  private

  def songs_params
    params.require(:song).permit(:released, :release_year, :artist_name, :genre, :title)
  end

end
