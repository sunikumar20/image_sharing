class AlbumsController < ApplicationController
  
  before_filter :authenticate_user
  layout 'admin'
  skip_before_action :verify_authenticity_token, only: ['destroy']
  
  def index
    @albums = Album.search(params)
  end

  def new
    @album =  Album.new
  end

  def create
    @album = current_user.albums.new(album_parameters)
    if @album.save
      redirect_to albums_path, :notice => 'Record Created.'
    else
      render "new" 
    end
  end

  def edit
    @album =  Album.find_by_id(params[:id])
  end

  def update
    @album =  Album.find_by_id(params[:id])
    if @album.update_attributes(album_parameters)
      redirect_to albums_path, :notice => 'Record Updated.'
    else
      render "new" 
    end
  end

  def show
    @images =  Album.find_by_id(params[:id]).images.page(params[:page]).per(10)
  end

  def destroy
    @album =  Album.find_by_id(params[:id])
    @album.destroy if @album.present?
    redirect_to albums_path
  end

  private
    def album_parameters
      params.require(:album).permit!
    end
end