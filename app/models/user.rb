class User < ApplicationRecord
    has_many :everychecks

    #ユーザーが食べた食品のレコード抽出##
    def user_eattings(eats)
        #食べたものリスト
        eattings = []      

        #食べたものパラメーター分オブジェクト作成ただしconfirmなのでsaveはまだしない
        eats.each do |eat|      
           eatInstance = self.everychecks.new(
              foodname: eat[:foodname], 
              calorie: eat[:calorie],
              eat_date: eat[:eat_date]
           )
           eattings.push(eatInstance)
        end
        return eattings
    end
    
end
