class Point

  attr_reader :lat, :lon, :elevation

  def initialize(lon, lat, elevation=nil)
    @lon = lon
    @lat = lat
    @elevation = elevation
  end

  def to_json
    # Add the coordinate
    j = '['
    j += "#{@lon},#{@lat}"
    if @elevation != nil
      j += ",#{@elevation}"
    end
    j += ']'
    return j
  end
end