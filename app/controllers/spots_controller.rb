class SpotsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  
  def index
    @spots  = Spot.all
  end

  def show
    @spot = Spot.find(params[:id])
  end

  def new
    @spot = Spot.new
  end

  def create
    @spot = Spot.new(params[:spot])
    if @spot.save
      flash[:notice] = "Successfully created spot."
      redirect_to @spot
    else
      render :action => 'new'
    end
  end

  def edit
    @spot = Spot.find(params[:id])
  end

  def update
    @spot = Spot.find(params[:id])
    if @spot.update_attributes(params[:spot])
      flash[:notice] = "Successfully updated spot."
      redirect_to spot_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @spot = Spot.find(params[:id])
    @spot.destroy
    flash[:notice] = "Successfully destroyed spot."
    redirect_to spots_url
  end
  def ddupload
    spot = Spot.find(params[:id])
    paint = spot.paintings.build(:image => params[:file])
    paint.save 
    spot.save
    name = paint.image.url.split("/")[-1]
    ret = { "name" => name , "type" => name.split(".")[-1], "size" => paint.image.size}
    render :json => ret.to_json

  end
      
end
