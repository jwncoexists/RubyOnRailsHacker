class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.references :blog, index: true
      t.string :type
      t.string :title
      t.string :image
      t.text :body
      t.integer :sequence

      t.timestamps
    end
  end
end
