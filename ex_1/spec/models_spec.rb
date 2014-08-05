require_relative '../app'

describe "Doctor" do
	let(:doctor) {Doctor.create(name: "Dr. Bob", specialization: "Internal Medicine")}

  it "should have a specialization" do
  	expect(doctor.specialization).to eq("Internal Medicine")
  end
end


describe "Patient" do
	let(:doctor_bob) {Doctor.create(name: "Dr. Bob")}
	let(:tom) {Patient.create(name: "Tom")}

	it "should have a collection of doctors" do
		tom.reload
		expect(tom).to respond_to(:doctors)
	end
end


describe "Doctor Patient Relationship" do 
	let(:doctor_lisa) {Doctor.create(name: "Dr. Lisa")}
	let(:mike) {Patient.create(name: "Mike")}
	let(:health_care) {DoctorPatientRelationship.create(doctor: doctor_lisa, patient: mike, primary_care: true)}
 
 	it "should specficy if the relationship is a primary care provider" do
 		expect(health_care.primary_care).to eq(true)
 	end
end