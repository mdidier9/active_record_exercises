class Doctor < ActiveRecord::Base
  has_many :doctor_patient_relationships, foreign_key: :physician_id
  has_many :clients, through: :doctor_patient_relationships, source: :patient

  validates_presence_of :name, :specialization
end

class Patient < ActiveRecord::Base
  has_many :doctor_patient_relationships
  has_many :doctors, through: :doctor_patient_relationships

  validates_presence_of :name, :email, :phone_number
end

class DoctorPatientRelationship < ActiveRecord::Base
  belongs_to :doctor, foreign_key: :physician_id
  belongs_to :patient

  validate :primary_care, presence: true, allow_nil: true
end