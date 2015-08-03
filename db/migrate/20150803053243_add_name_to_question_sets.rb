class AddNameToQuestionSets < ActiveRecord::Migration
  def change
    add_column :question_sets, :name, :string
  end
end
