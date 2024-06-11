class CollegeApi

  def self.search(name, per_page = 100)
    fields  = "_fields=school.name,location.lat,location.lon" 
    uri     = URI("https://api.data.gov/ed/collegescorecard/v1/schools?api_key=#{self.key}&#{fields}&school.name=#{name}&per_page=#{per_page}")

    results =  Rails.cache.fetch("#{name}/search", expires_in: 2.days) do
       Rails.logger.warn("<<< Retrieving Data from: api.data.gov >>>")
       Net::HTTP.get(uri)
    end
    
    JSON.parse(results)
  end

  def self.key
    ENV['COLLEGE_API_KEY']
  end
end
