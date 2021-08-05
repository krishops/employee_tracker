# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Division.destroy_all
Employee.destroy_all
Project.destroy_all

5.times do |index|
  division = Division.create!(name: Faker::Commerce.department)
  3.times do |index|
    Employee.create!(name: Faker::Name.name, role: Faker::Company.profession, division_id: division.id)
  end
end

5.times do |index|
  Project.create!(title: Faker::Hipster.word)
end

p "Created #{Division.count} divisions, #{Employee.count} employees, #{Project.count} projects."
