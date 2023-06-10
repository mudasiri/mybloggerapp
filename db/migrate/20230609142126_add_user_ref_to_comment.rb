# frozen_string_literal: true

class AddUserRefToComment < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :author, column: :author_id, null: false, foreign_key: { to_table: :users }
  end
end
