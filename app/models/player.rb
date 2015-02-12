class Player < ActiveRecord::Base
 belongs_to :team
 belongs_to :user
attr_accessible :team_id, :user_id, :role


  role = ["GoalKeeper","Central Defender","left back","right back","midfielder","striker"]
end
