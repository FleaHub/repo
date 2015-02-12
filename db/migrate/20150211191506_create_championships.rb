class CreateChampionships < ActiveRecord::Migration
  def change
    create_table :championships do |t|
      t.string :name
      t.text :description
      t.string :logo
      t.string :user_id
      t.string :team_id

      t.timestamps
    end
  end
end
