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
        self.cult_oaths.count
    end

    def cult_oaths
        BloodOath.all.select {|oath| oath.cult == self}
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

    def average_age
        age = self.cult_oaths.map {|oath| oath.follower.age.to_f}
        average_age = age.sum / age.count
    end

    def my_followers_mottos
        self.cult_oaths.map {|oath| oath.follower.life_motto}
    end

    def self.least_popular
        smallest_population = 1000000000000000000
        smallest_cult = nil
        self.all.select do |cult| 
            #smallest_population = cult.cult_population
            #binding.pry
            if cult.cult_population < smallest_population
            smallest_population = cult.cult_population
            smallest_cult = cult
            #binding.pry
            end
        end
        return smallest_cult
    end

    def self.most_common_location
        location_numbers = self.all.each_with_object({}) do |cult, value| 
            if value[cult.location]
            value[cult.location] += 1
            else
                value[cult.location] = 1
            end
        end
        sorted_locations = location_numbers.sort_by {|key, value| value}
        sorted_locations[-1][0]
    end

    
end