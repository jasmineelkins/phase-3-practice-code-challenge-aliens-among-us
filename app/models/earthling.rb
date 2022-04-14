class Earthling < ActiveRecord::Base
  has_many :visitations, dependent: :destroy
  has_many :aliens, through: :visitations

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def self.filter_by_job(job)
    Earthling.all.filter do |earthling|
      if earthling[:job] = job
        return earthling.full_name
      end
    end
  end
end
