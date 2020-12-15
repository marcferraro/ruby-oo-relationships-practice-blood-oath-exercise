require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console


heavens_gate = Cult.new("Heaven's Gate", "Arizona", 1960, "Time to Ascend")
children_of_the_atom = Cult.new("Children of the Atom", "Washington DC", 2040, "Praise the Atom")

joe = Follower.new("Joe", 32, "To the Moon")
kelly = Follower.new("Kelly", 40, "Life gives you lemons")
marc = Follower.new("Marc", 25, "RIP")


oath1 = heavens_gate.recruit_follower("1962", joe)
oath2 = heavens_gate.recruit_follower("1963", kelly)
oath3 = marc.join_cult("2020", children_of_the_atom)
binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits