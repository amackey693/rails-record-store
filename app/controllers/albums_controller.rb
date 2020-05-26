class AlbumsController < ApplicationController

  def index
    @albums = Album.all
    render :index
  end

  def new
    @album = Album.new
    render :new
  end

  def create
    @album = Album.new(album_params)
    if @album.save 
      flash[:notice] = "Album Saved friendo!"
      redirect_to albums_path
    else
      render :new
    end
  end

def edit
  @album = Album.find(params[:id])
  render :edit
end

def show
  @album = Album.find(params[:id])
  render :show
end

def update
  @album = Album.find(params[:id])
  if @album.update(album_params)
    redirect_to albums_path
  else
    render :edit
  end
end

def destroy
  @album = Album.find(params[:id])
  if @album.destroy 
    flash[:notice] = "You decided to DESTROY #{@album.name}"
    redirect_to albums_path
  else
    flash[:notice] = "Probably for the best you didn't destroy that"
    redirect_to albums_path
  end
end

  private 
    def album_params
      params.require(:album).permit(:name, :genre)
    end

end