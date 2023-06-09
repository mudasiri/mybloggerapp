# frozen_string_literal: true

class AddUserRefToPost < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :author_id, null: false, foreign_key: true
  end
end
