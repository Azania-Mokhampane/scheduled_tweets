class Tweet < ApplicationRecord
  belongs_to :user
  belongs_to :twitter_account

  validates :body, length: { minimum: 1, maximum: 280 }
  validates :publish_at, presence: true

  after_initialize do
    self.publish_at ||= 24.hours.from_now
  end

  def published?
    # adding a questions mark to the end of a method name is a convention in Ruby to indicate that the method returns a boolean value
    tweet_id?
  end
end
