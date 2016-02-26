class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :omniauthable
  include DeviseTokenAuth::Concerns::User
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_bills
  has_many :bills, through: :user_bills

  def votes
    Vote.where(voter_id: self.id)
  end

  def upvotes
    votes.select { |v| v.vote_flag == true }
  end

  def downvotes
    votes.select { |v| v.vote_flag == false }
  end

end
