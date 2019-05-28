# frozen_string_literal: true

class SongsController < ApplicationController
  def show
    find_song
    flash[:success] ='Viewing a song'
  end

  def index
    @songs = Song.all
    flash[:success] ='Viewing all songs'
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      flash[:success] = "Song created successfully!"
      redirect_to @song
    else
      flash[:errors] = "Song create failed"
      render :new
    end
  end

  def edit
    find_song
  end

  def update
    find_song
    if @song.update(song_params)
      flash[:success] = "Song updated successfully!"
      redirect_to song_path(@song)
    else
      flash[:errors] = "Song update failed"
      render :edit
    end
  end

  def destroy
    find_song
    @song.destroy
    flash[:success] = "Delete success"
    redirect_to songs_path
  end

  private

  def find_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end
end
