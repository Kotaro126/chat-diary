class CreateWords < ActiveRecord::Migration[6.0]
  def change
    create_table :words do |t|
      t.string :word_name,  null: false
      t.text :example,      null: false
      t.references :user,   null: false, foreign_key: true
      t.references :diary,  null: false, foreign_key: true
      t.timestamps
    end
  end
end
