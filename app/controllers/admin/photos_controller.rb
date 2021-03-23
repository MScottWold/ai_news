class Admin::PhotosController < ApplicationController
  layout 'admin' 
  before_action :validate_admin_login
  
  def show
    @photo = Photo.find_by(id: self.params[:id])

    render :show
  end

  def index
    @photos = Photo
      .all
      .order(id: :asc)
      .with_attached_thumbnail
      .with_attached_image  
    
    render :index
  end

  def new
    @photo = Photo.new

    render :photo_form
  end

  def create
    @photo = Photo.new(photo_params)

    if @photo.save
      redirect_to admin_articles_path
    else
      flash[:errors] = @photo.errors.full_messages
      redirect_to new_admin_photo_path
    end
  end

  def edit
    @photo = Photo.find_by(id: self.params[:id])
    render :photo_form
  end

  def update
    @photo = Photo.find_by(id: self.params[:id])
    if @photo.update(photo_params)
      redirect_to admin_photo_path(@photo)
    else
      flash[:errors] = @photo.errors.full_messages
      redirect_to edit_admin_photo(@photo)
    end
  end

  def destroy
    @photo = Photo.find_by(id: self.params[:id])
    @photo.try(:destroy)
    redirect_to admin_photos_path
  end

  private

  def photo_params
    self.params.require(:photo).permit(
      :alt_text,
      :title,
      :source_url,
      :photographer_name,
      :photographer_url,
      :license_type,
      :license_url,
      :thumbnail,
      :image
    )
  end
end