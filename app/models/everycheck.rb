class Everycheck < ApplicationRecord
    belongs_to :user
    
    #ごうけいのカロリーをけいさんするメソッドです。###
    def self.total_cal(eattings)
      totalcal = 0
      eattings.each do |eat|
        totalcal += eat.calorie.to_i
      end   
      return totalcal
    end
end
