#!/usr/bin/env ruby

require_relative 'src/point'
require_relative 'src/track-segment'
require_relative 'src/track'
require_relative 'src/waypoint'
require_relative 'src/world'


def main()
  w = Waypoint.new(-121.5, 45.5, 30, "home", "flag")
  w2 = Waypoint.new(-121.5, 45.6, nil, "store", "dot")

  ts1 = [
    Point.new(-122, 45),
    Point.new(-122, 46),
    Point.new(-121, 46),
  ]
  ts2 = [
    Point.new(-121, 45),
    Point.new(-121, 46),
  ]
  ts3 = [
    Point.new(-121, 45.5),
    Point.new(-122, 45.5),
  ]

  t = Track.new([ts1, ts2], "track 1")
  t2 = Track.new([ts3], "track 2")

  world = World.new("My Data", [w, w2, t, t2])

  puts world.to_geojson()
end

if File.identical?(__FILE__, $0)
  main()
end
