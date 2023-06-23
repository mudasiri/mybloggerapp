class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  after_create :increment_user_posts_counter

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, :likes_counter, presence: true,
                                               numericality: { greater_than_or_equal_to: 0, only_integer: true }

  def five_most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def increment_user_posts_counter
    author.increment!(:posts_counter)
  end
end
