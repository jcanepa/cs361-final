#!/usr/bin/env ruby

require_relative 'src/classes/point'
require_relative 'src/classes/track-segment'
require_relative 'src/classes/track'
require_relative 'src/classes/waypoint'
require_relative 'src/classes/world'

def main()
  # waypoints with optional fields
  w = Waypoint.new(
    Point.new(-121.5, 45.5, 30),
    "home",
    "flag")

  w2 = Waypoint.new(
    Point.new(-121.5, 45.6, nil),
    "store",
    "dot")

  # three collections of points
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

  # new tracks are instantiated with groups of collections of points, and a name
  t = Track.new(
    [TrackSegment.new(ts1), TrackSegment.new(ts2)],
    "track 1")
  t2 = Track.new(
    [TrackSegment.new(ts3)],
    "track 2")

  # create world with name and a collection of (waypoints and tracks)
  world = World.new("My Data", [w, w2, t, t2])

  # echo a json representation of the world
  puts world.to_json()
end

if File.identical?(__FILE__, $0)
  main()
end
