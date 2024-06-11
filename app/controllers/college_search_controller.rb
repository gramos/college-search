class CollegeSearchController < ApplicationController

  def index
    @center = { 'lat' => 0, 'lon' => 0 }
  end

  def search
    @colleges = CollegeApi.search(params['college_name'])
    
    if @colleges['results'].empty?
      @center = { 'lat' => 0, 'lon' => 0 }
      flash.now[:notice] = "There are no results for the search"
    else
      @center  = Geo.calculate_center(@colleges['results'])
    end

    update_maps
  end

  private

  def update_maps
    render turbo_stream:
      turbo_stream.replace("maps",
        partial: "maps",
        locals: {center: @center, colleges: @colleges}
      )
  end
end
