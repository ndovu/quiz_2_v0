class Idea < ActiveRecord::Base
  belongs_to :user
  validates :title, presence:   {message: "must be provided."}, 
                    uniqueness: {case_sensitive: false},
                    length:     {minimum: 10}

  validates :body, presence: true

  has_many :comments, dependent: :destroy

  has_many :joins, dependent: :destroy
  has_many :joined_users, through: :joins, source: :user
  
  def join_for(user)
    joins.find_by_user_id(user.id) if user
  end

end
