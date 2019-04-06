class RemoveTypeInQuestionnaires < ActiveRecord::Migration[5.2]
  def change
  	remove_column :questionnaires, :type, :string
  	add_column :questionnaires, :field_type, :string
  	# add_column :questionnaires, :fields, :text
  	add_column :questionnaires, :answer, :text
  	add_column :forms, :answers, :text
  end
end
