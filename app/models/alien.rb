class Alien < ActiveRecord::Base
  has_many :visitations
  has_many :earthlings, through: :visitations

  def visit(earthling)
    # creates a visitation linking earthling and this alien on today's date
    Visitation.create(
      date: Date.new,
      alien_id: self.id,
      earthling_id: earthling[:id],
    )
  end

  def total_light_years_traveled
    # returns the lightyears from alien's home planet x 2
    "#{self.light_years_to_home_planet * 2}"
  end

  def self.most_frequent_visitor
    # returns Alien with most visitations - .maximum?

    Alien.all.find_by_id(Visitation.maximum(:alien_id)).name
  end

  def self.average_light_years_to_home_planet
    # returns avg distance for all aliens to their home planets
    Alien.sum(:light_years_to_home_planet) / Alien.count
  end
end
