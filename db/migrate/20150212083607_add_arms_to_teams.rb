class AddArmsToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :arms, :string
  end
end
