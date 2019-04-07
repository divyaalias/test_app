class CreateFields < ActiveRecord::Migration[5.2]
  def change
    create_table :fields do |t|
      t.integer :questionnaire_id
      t.text :names
      t.timestamps
    end
  end
end
