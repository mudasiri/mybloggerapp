# frozen_string_literal: true

class AddUserRefToLike < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :author_id, null: false, foreign_key: { to_table: :users }
  end
end
