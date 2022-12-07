# Waypoint is a point represented by a latitude, longitude, and optional elevation.
# A waypoint also has an optional name and icon.
# (e.g. a name might be "ACME Dining" and the icon might be "restaurant".)

class Waypoint

  attr_reader :lat, :lon, :elevation, :name, :type

  def initialize(lon, lat, elevation=nil, name=nil, type=nil)
    @lat = lat
    @lon = lon
    @elevation = elevation
    @name = name
    @type = type
  end

  def get_waypoint_json(indent=0)
    j = '{"type": "Feature",'
    # if name is not nil or type is not nil
    j += '"geometry": {"type": "Point","coordinates": '
    j += "[#{@lon},#{@lat}"
    if elevation != nil
      j += ",#{@elevation}"
    end
    j += ']},'
    if name != nil or type != nil
      j += '"properties": {'
      if name != nil
        j += '"title": "' + @name + '"'
      end
      if type != nil  # if type is not nil
        if name != nil
          j += ','
        end
        j += '"icon": "' + @type + '"'  # type is the icon
      end
      j += '}'
    end
    j += "}"
    return j
  end
end