require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console


heavens_gate = Cult.new("Heaven's Gate", "Arizona", 1960, "Time to Ascend")
children_of_the_atom = Cult.new("Children of the Atom", "Washington DC", 2040, "Praise the Atom")
circle_of_iron = Cult.new("Circle of Iron", "Washington DC", 2045, "We are your only Family")
believers_of_rain = Cult.new("Believer's of Rain", "Washington DC", 2002, "Let the Rain Pour Down")
descendants_of_the_forest = Cult.new("Descendants of the Forest", "Arizona", 1999, "We Emerge")
the_mountain_ones = Cult.new("The Mountain Ones", "Oregon", 1990, "We Descend")


joe = Follower.new("Joe", 32, "To the Moon")
kelly = Follower.new("Kelly", 40, "Life gives you lemons")
marc = Follower.new("Marc", 25, "RIP")


oath1 = heavens_gate.recruit_follower("1962", joe)
oath2 = heavens_gate.recruit_follower("1963", kelly)
oath3 = marc.join_cult("2020", children_of_the_atom)
oath4 = joe.join_cult("1987", the_mountain_ones)
binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits