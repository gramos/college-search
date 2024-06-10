require 'net/http'

class CollegeSearchController < ApplicationController

  def index
    @center = { 'lat' => 0, 'lon' => 0 }
  end

  def search
    api_key = "qo1hY1KnV9gWzslbA3y2nK9fLe2ZXtRKfOVndNha"
    fields  = "_fields=school.name,location.lat,location.lon" 
    uri     = URI("https://api.data.gov/ed/collegescorecard/v1/schools?api_key=#{api_key}&#{fields}&school.name=#{params['college_name']}")

    @results  = Net::HTTP.get(uri)
    @colleges = JSON.parse(@results)
    @center   = Geo.calculate_center(@colleges['results'])

    render :index
  end
end
