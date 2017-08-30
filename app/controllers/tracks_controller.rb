class TracksController < ApplicationController
  def new
    @album = Album.find(params[:album_id])
    @track = Track.new
  end

  def create
    track = Track.new(track_params)
    track.album = Album.find(params[:album_id])
    if track.save
      redirect_to album_path(track.album)
    else
      redirect_to new_album_track_path(track.album)
    end
  end


  def edit
    @album = Album.find(params[:album_id])
    @track = Track.find(params[:id])
  end

  def update
    @track = Track.find(params[:id])
    if @track.update(track_params)
      redirect_to album_path(@track.album)
    else
      redirect_to edit_album_track_path(Album.find(params[:album_id]), @track)
    end
  end

  def destroy
    @album = Album.find(params[:album_id])
    @track = Track.find(params[:id])
    @track.destroy
    redirect_to album_path(@album)
  end

  private
    def track_params
      params.require(:track).permit(:t_title, :track_no, :album)
    end
end
