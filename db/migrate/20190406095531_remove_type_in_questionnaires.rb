class RemoveTypeInQuestionnaires < ActiveRecord::Migration[5.2]
  def change
  	remove_column :questionnaires, :type, :string
  	add_column :questionnaires, :field_type, :string
  end
end
