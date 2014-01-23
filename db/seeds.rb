# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

$stdout.sync = true
team_names = ['Silver Bullets', 'Red Hawks', 'Green Dragons', 'Purple Pandas']
zone_names = ['A','B','C','D','E','F']
target_names = ['a','b','c']
hints = ['Not telling!','Over there!','I would try over there...']

print 'Removing existing collections ...'
Player.collection.remove
Target.collection.remove
Team.collection.remove
Game.collection.remove
puts ' done.'

print 'Seeding targets ...'
zone_names.each do |zn|
  target_names.each do |tn|
    t = Target.new
    t.name = "Target#{zn}-#{tn}"
    t.description = "A vague description."
    t.hint = "A helpful hint."
    t.image_url = "/assets/#{zn}-#{tn}.jpg"
    t.lat = 123.456
    t.lon = 567.890
    t.save
  end
end
puts ' done.'

print 'Creating game ...'
g = Game.new
g.name = "Ultimate Scavenger Hunt"
zone_names.each do |zn|
  z = TargetZone.new
  z.name = zn
  z.map = { :data => "data" }
  target_names.each do |tn|
    z.targets.push(Target.find_by_name("Target#{zn}-#{tn}"))
  end
  g.target_zones << z
end
g.save
puts ' done.'