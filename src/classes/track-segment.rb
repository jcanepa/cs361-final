# This is a list of latitude/longitude pairs (with optional elevation).
# The points of a Track Segment do not have names or icons.
# The Track Segment represents a section of a Track.

class TrackSegment

  attr_reader :coordinates

  def initialize(coordinates)
    @coordinates = coordinates
  end

  def to_json
    j = '['
    # Loop through each coordinate
    tsj = ''
    @coordinates.each do |c|
      # comma separate if not first object in sequence
      if tsj != ''
        tsj += ','
      end
      tsj += c.to_json
    end
    j+=tsj
    j+=']'
    return j
  end
end