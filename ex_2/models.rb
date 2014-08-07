class Person < ActiveRecord::Base
  has_many :phases
  has_many :cohorts, through: :phases
end


class Cohort < ActiveRecord::Base
  has_many :phases
  has_many :students, through: :phases

  belongs_to :cohort_lead, class_name: "Person"
end


class Phase < ActiveRecord::Base
  belongs_to :cohort
  belongs_to :student, class_name: "Person"
  belongs_to :phase_lead, class_name: "Person"
end
