class CreateQualifications < ActiveRecord::Migration
  def change
    create_table :qualifications do |t|
      t.text :add
      t.belongs_to :idea, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
