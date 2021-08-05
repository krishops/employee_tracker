class Employee < ApplicationRecord
  belongs_to :division

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