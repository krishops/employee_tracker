class Employee < ApplicationRecord
  belongs_to :division
  has_and_belongs_to_many(:projects)

  validates :name, presence: :true
  validates :role, presence: :true

  scope :manager, -> { where(role: "Manager") }

  scope :today, -> { where("created_at >=?", Time.now.beginning_of_day)}

  before_save(:titleize_employee)

  private
    def titleize_employee
      self.name = self.name.titleize
    end
end