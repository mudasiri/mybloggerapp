class Comment < ApplicationRecord
    belongs_to :author, class_name: 'User'
    belongs_to :post

    after_create :increment_user_posts_counter

  def five_most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def increment_user_posts_counter
    author.increment!(:posts_counter)
  end
end
