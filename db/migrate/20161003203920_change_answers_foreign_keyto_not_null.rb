class ChangeAnswersForeignKeytoNotNull < ActiveRecord::Migration
  def change
    change_column_null :answers, :user_id, false
    change_column_null :answers, :question_id, false
  end
end
