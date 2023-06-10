# frozen_string_literal: true

class CreatePost < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :text
      t.integer :comments_counter
      t.integer :likes_counter
      t.timestamps
    end
    add_reference :posts, :author, column: :author_id, null: false, foreign_key: { to_table: :users }
  end
end
