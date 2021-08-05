require 'rails_helper'

describe Employee do
  it { should belong_to(:division) }

  it { should validate_presence_of :name }

  it { should validate_presence_of :role }

  it("titleizes the name of an employee") do
    division = Division.create({name: "Human Resources"})
    employee = Employee.create({name: "kristen hopper", role: "team lead", division_id: division.id})
    expect(employee.name()).to(eq("Kristen Hopper"))
  end
end