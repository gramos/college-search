class CollegeApi

  def self.search(name)
    fields  = "_fields=school.name,location.lat,location.lon" 
    uri     = URI("https://api.data.gov/ed/collegescorecard/v1/schools?api_key=#{self.key}&#{fields}&school.name=#{name}")

    results =  Rails.cache.fetch("#{name}/search", expires_in: 2.days) do
       Rails.logger.warn("<<< Retrieving Data from: api.data.gov >>>")
       Net::HTTP.get(uri)
    end
    
    JSON.parse(results)
  end

  def self.key
    "qo1hY1KnV9gWzslbA3y2nK9fLe2ZXtRKfOVndNha"
  end
end
