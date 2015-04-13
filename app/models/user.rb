class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Associations
  # User has many ideas
  has_many :ideas, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :joins, dependent: :destroy
  has_many :joined_ideas, through: :joins, source: :idea

  has_many :likes, dependent: :destroy
  has_many :liked_ideas, through: :likes, source: :idea

  def name_display
    if first_name || last_name
      "#{first_name} #{last_name}".strip.squeeze(" ")
    else
      email
    end
  end
end

