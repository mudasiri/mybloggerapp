# frozen_string_literal: true

class CreateComment < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :text
      t.timestamps
    end
    add_reference :comments, :author, column: :author_id, null: false, foreign_key: { to_table: :users }
  end
end
