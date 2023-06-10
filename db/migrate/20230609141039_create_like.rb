# frozen_string_literal: true

class CreateLike < ActiveRecord::Migration[7.0]
  def change
    create_table :likes, &:timestamps
    add_reference :likes, :author, column: :author_id, null: false, foreign_key: { to_table: :users }
  end
end
