class AddReleasedToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :released, :boolean, default: false
  end
end
