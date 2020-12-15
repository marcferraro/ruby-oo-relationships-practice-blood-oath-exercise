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
            #binding.pry
            if oath.follower == self
                #binding.pry
                oath.cult.slogan
            end
        end
        return slogan_array.compact!
    end

    def self.most_active
        BloodOath.all.map {|oath| oath.follower.cults}
        #binding.pry
    end

    
end