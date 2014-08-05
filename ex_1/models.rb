class Doctor < ActiveRecord::Base
	has_many :doctor_patient_relationships
	has_many :patients, through: :doctor_patient_relationships
end

class Patient < ActiveRecord::Base
	has_many :doctor_patient_relationships
	has_many :doctors, through: :doctor_patient_relationships
end

class DoctorPatientRelationship < ActiveRecord::Base
	belongs_to :doctor
	belongs_to :patient
end