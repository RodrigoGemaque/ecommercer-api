class SystemRequirement < ApplicationRecord
  has_many :games, dependent: :restrict_with_error

  
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  
  validates :operational_system,
            :storage,
            :processor,
            :memory,
            :video_board, presence: true
  # validates :storage, presence: true
  # validates :processor, presence: true
  # validates :memory, presence: true
  # validates :video_board, presence: true

  # incluindo os concerns
  include LikeSearchable
  include Paginatable

end
