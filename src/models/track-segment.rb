# This is a list of latitude/longitude pairs (with optional elevation).
# The points of a Track Segment do not have names or icons.
# The Track Segment represents a section of a Track.

class TrackSegment

  attr_reader :coordinates

  def initialize(coordinates)
    @coordinates = coordinates
  end
end