class World

  def initialize(name, things)
    @name = name
    @features = things
  end

  def add_feature(f)
    @features.append(t)
  end

  def to_geojson(indent=0)
    # Write stuff
    s = '{"type": "FeatureCollection","features": ['

    @features.each_with_index do |f,i|
      if i != 0
        s +=","
      end
      s += f.to_json
    end
    s + "]}"
  end

end