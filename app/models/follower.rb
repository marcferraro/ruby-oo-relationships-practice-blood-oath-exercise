require 'pry'

class Follower
    def initialize(name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto
        @@all << self
    end

    @@all = []

    attr_accessor :name, :life_motto
    attr_reader :age

    def cults
        BloodOath.all.select {|oath| oath.follower == self}
    end

    def join_cult(initiation_date, cult_instance)
        BloodOath.new(initiation_date, self, cult_instance)
    end

    def self.all
        @@all
    end

    def self.of_a_certain_age(age)
        self.all.select {|follower| follower.age >= age}
    end

    def my_cults_slogans
        slogan_array = BloodOath.all.map do|oath|
            if oath.follower == self
                oath.cult.slogan
            end
        end
        return slogan_array.compact!
    end

    def self.followers
        array = []
        BloodOath.all.select do |oath| 
            array << oath.follower
        end
        array
    end

    def self.most_active
        follower_names = self.followers.map {|follower| follower.name}
        most_active = follower_names.max_by {|name| follower_names.count(name)}
        self.followers.find {|follower| follower.name == most_active}
    end

    
end