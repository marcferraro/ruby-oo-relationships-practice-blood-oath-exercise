require 'pry'

class Cult
    attr_accessor :name, :location, :founding_year, :slogan

    def initialize (name, location, founding_year, slogan)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        @@all << self
    end

    @@all = []

    def self.all
        @@all
    end
    

    def recruit_follower(initiation_date, follower_instance)
        BloodOath.new(initiation_date, follower_instance, self)
    end

    def cult_population
        BloodOath.all.select {|oath| oath.cult == self}.count
    end

    def self.find_by_name(cult_name)
        self.all.find {|cult| cult.name == cult_name}
    end
    
    def self.find_by_location(cult_location)
        self.all.find {|cult| cult.location == cult_location}
    end

    def self.find_by_founding_year(year)
        self.all.find {|cult| cult.founding_year == year}
    end
end