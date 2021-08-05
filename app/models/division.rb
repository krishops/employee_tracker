class Division < ApplicationRecord
  has_many :employees, dependent: :destroy

  validates :name, presence: :true

  before_save(:titleize_division)

  private
    def titleize_division
      self.name = self.name.titleize
    end
end