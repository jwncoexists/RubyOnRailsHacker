class AddIndicesToBlogs < ActiveRecord::Migration
  def change
    add_index :blogs, :user_id
    add_index :blogs, :released
    add_index :blogs, :title
    add_index :blogs, :body
  end
end
