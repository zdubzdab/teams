class TeamUser < ActiveRecord::Base

  belongs_to :team
  belongs_to :user

  validates :team_id, :user_id, presence: true

end
