# This is a list of Track Segments. It has an optional name.

class Track
  attr_reader :segments, :name
  def initialize(segments, name=nil)
    @segments = segments
    @name = name
  end

  def to_json()
    j = "{"
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
      j += s.to_json()
    end

    j + ']}}'
  end
end