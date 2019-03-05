class Tweet < ApplicationRecord
  #Timeline Start
  #アソシエーション(1:多)
  belongs_to :user
  #Timeline End
end
