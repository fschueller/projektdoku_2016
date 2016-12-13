class Externaltool < ActiveRecord::Base
  belongs_to :user, inverse_of: :externaltools
  TYPES = %w(Github Trello)
  before_save :set_type
  validates :type, presence: true, inclusion: { in: TYPES }
  validates :alias, format: { with: /\A[^@\s]+\Z/ }
  has_paper_trail

  def self.types
    TYPES
  end

  def set_type
    raiser "Override this method in each model inheriting from Externaltool"
  end
end
