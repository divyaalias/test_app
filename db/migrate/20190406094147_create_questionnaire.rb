class CreateQuestionnaire < ActiveRecord::Migration[5.2]
  def change
    create_table :questionnaires do |t|
      t.integer :form_id
      t.string :questions
      t.string :type
      t.timestamps
    end
  end
end
