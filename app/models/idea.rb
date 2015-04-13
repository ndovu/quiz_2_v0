class Idea < ActiveRecord::Base
  belongs_to :user
  validates :title, presence:   {message: "must be provided."}, 
                    uniqueness: {case_sensitive: false},
                    length:     {minimum: 10}

  validates :body, presence: true

  has_many :comments, dependent: :destroy
end
