# frozen_string_literal: true

class AddPostRefToLike < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :post_id, null: false, foreign_key: { to_table: :users }
  end
end
