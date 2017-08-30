class AlbumsController < ApplicationController
  def index
    @albums = Album.all.order(:title)
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
    @album = Album.new
  end

  def create
    album = Album.new(album_params)
    if album.save
      redirect_to albums_path
    else
      render :new
    end
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)
      redirect_to albums_path
    else
      render :edit
    end
  end

  def title_sort
    @albums = Album.all.order(:title)
    render :index
  end

  def artist_sort
    @albums = Album.all.order(:artist)
    render :index
  end

  def year_sort
    @albums = Album.all.order(:year)
    render :index
  end

  def genre_sort
    @albums = Album.all.order(:genre)
    render :index
  end


  def destroy
    album = Album.find(params[:id])
    album.destroy
    redirect_to albums_path
  end

  private
    def album_params
      params.require(:album).permit(:title, :artist, :year, :genre)
    end
end
