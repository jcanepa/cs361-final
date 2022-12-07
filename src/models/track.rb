require_relative 'track-segment'

# This is a list of Track Segments. It has an optional name.

class Track

  def initialize(segments, name=nil)
    @name = name
    segment_objects = []
    segments.each do |s|
      segment_objects.append(TrackSegment.new(s))
    end
    # set segments to segment_objects
    @segments = segment_objects
  end

  def get_track_json()
    j = '{'
    j += '"type": "Feature", '
    if @name != nil
      j+= '"properties": {'
      j += '"title": "' + @name + '"'
      j += '},'
    end
    j += '"geometry": {'
    j += '"type": "MultiLineString",'
    j +='"coordinates": ['
    # Loop through all the segment objects
    @segments.each_with_index do |s, index|
      if index > 0
        j += ","
      end
      j += '['
      # Loop through all the coordinates in the segment
      tsj = ''
      s.coordinates.each do |c|
        if tsj != ''
          tsj += ','
        end
        # Add the coordinate
        tsj += '['
        tsj += "#{c.lon},#{c.lat}"
        if c.elevation != nil
          tsj += ",#{c.elevation}"
        end
        tsj += ']'
      end
      j+=tsj
      j+=']'
    end
    j + ']}}'
  end
end