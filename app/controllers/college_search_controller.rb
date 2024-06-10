require 'net/http'

class CollegeSearchController < ApplicationController

  def index
    @center = { 'lat' => 0, 'lon' => 0 }
  end

  def search
    @colleges = CollegeApi.search(params['college_name'])
    @center   = Geo.calculate_center(@colleges['results'])

    render :index
  end

end
