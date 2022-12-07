class Point

  attr_reader :lat, :lon, :elevation

  def initialize(lon, lat, elevation=nil)
    @lon = lon
    @lat = lat
    @elevation = elevation
  end

  def to_json
    tsj = '['
    tsj += "#{@lon},#{@lat}"
    if @elevation != nil
      tsj += ",#{@elevation}"
    end
    tsj += ']'
    return tsj
  end
end