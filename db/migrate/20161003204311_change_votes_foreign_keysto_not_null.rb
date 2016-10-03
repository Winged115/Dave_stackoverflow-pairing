class ChangeVotesForeignKeystoNotNull < ActiveRecord::Migration
  def change
    change_column_null :votes, :user_id, false
    change_column_null :votes, :votable_id, false
  end
end
