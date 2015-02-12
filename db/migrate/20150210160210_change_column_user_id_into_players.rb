class ChangeColumnUserIdIntoPlayers < ActiveRecord::Migration
  def up
    change_column :players, :user_id, :string
  end

  def down
  end
end
