class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :image
      t.text   :intro
      t.references :user

      t.timestamps
    end
  end
end
