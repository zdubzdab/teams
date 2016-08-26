class Role < ActiveRecord::Base

  before_save :generate_slug

  has_many :users
  
  validates :name, presence: true, uniqueness: true

  private

  def generate_slug
    self.slug = name.gsub(/\s+/, '_').downcase
  end

end
