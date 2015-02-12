class AddChampionshipIdToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :championship_id, :string
  end
end
