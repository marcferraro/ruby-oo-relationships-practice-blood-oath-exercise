require 'pry'

class BloodOath
    def initialize (initiation_date, follower_instance, cult_instance)
        @initiation_date = initiation_date
        @follower = follower_instance
        @cult = cult_instance
        @@all << self
    end

    @@all = []

    attr_reader :initiation_date, :follower, :cult

    def self.all
        @@all
    end

    
end