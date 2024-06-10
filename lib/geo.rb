class Geo
  include Math

  def self.to_radians(degrees)
   degrees * PI / 180.0
  end

  def self.to_degrees(radians)
    radians * 180.0 / PI
  end

  def self.remove_nil(points)
    points.map{|p| p unless p['location.lat'].nil? or p['location.lon'].nil? }.compact
  end
  
  def self.calculate_center(points)
    points = remove_nil(points)

    Rails.logger.warn('GEO ------------------------------ ')
    Rails.logger.warn(points.inspect)
    
    # Convert to radians
    
    lat_rad = points.map { |point| to_radians(point['location.lat']) }
    lon_rad = points.map { |point| to_radians(point['location.lon']) }

    # Convertir a coordenadas cartesianas
    x = lat_rad.zip(lon_rad).map { |lat, lon| Math.cos(lat) * Math.cos(lon) }
    y = lat_rad.zip(lon_rad).map { |lat, lon| Math.cos(lat) * Math.sin(lon) }
    z = lat_rad.map { |lat| Math.sin(lat) }

    # Calcular el punto medio en coordenadas cartesianas
    x_avg = x.sum / x.size
    y_avg = y.sum / y.size
    z_avg = z.sum / z.size

    # Convertir de nuevo a coordenadas esféricas
    lon_avg = Math.atan2(y_avg, x_avg)
    hyp     = Math.sqrt(x_avg**2 + y_avg**2)
    lat_avg = Math.atan2(z_avg, hyp)

    # Convertir a grados
    lat_center = to_degrees(lat_avg)
    lon_center = to_degrees(lon_avg)
    
    { 'lat' => lat_center, 'lon' => lon_center }
  end
end
