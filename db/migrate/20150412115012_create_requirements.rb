class CreateRequirements < ActiveRecord::Migration
  def change
    create_table :requirements do |t|
      t.string :name
      t.belongs_to :idea, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
