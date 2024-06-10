class CollegeApi

  def self.search(name)
    fields  = "_fields=school.name,location.lat,location.lon" 
    uri     = URI("https://api.data.gov/ed/collegescorecard/v1/schools?api_key=#{key}&#{fields}&school.name=#{name}")
    results = Net::HTTP.get(uri)

    JSON.parse(results)
  end

  def self.key
    "qo1hY1KnV9gWzslbA3y2nK9fLe2ZXtRKfOVndNha"
  end
end
