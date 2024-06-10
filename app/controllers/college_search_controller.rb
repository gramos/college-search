require 'net/http'

class CollegeSearchController < ApplicationController

  def index
    Rails.logger.warn("EN INDEX -----------------------------")
    @aux = "AUX"
  end

  def search
    api_key = "qo1hY1KnV9gWzslbA3y2nK9fLe2ZXtRKfOVndNha"
    uri     = URI("https://api.data.gov/ed/collegescorecard/v1/schools?api_key=#{api_key}")

    @results = Net::HTTP.get(uri)
    @colleges = JSON.parse(@results)
    Rails.logger.warn(@colleges.inspect)

    render :index
  end
end
