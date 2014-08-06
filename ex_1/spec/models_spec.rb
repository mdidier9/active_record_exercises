require_relative '../app'

describe "Doctor" do
	let(:doctor_1) {Doctor.create(name: "Dr. Bob", specialization: "Internal Medicine")}
	let(:doctor_2) {Doctor.create(specialization: "Radiology")}

  it "should have a specialization property" do
  	expect(doctor_1.specialization).to eq("Internal Medicine")
  end

  it "should require the name property at creation" do
  	expect(doctor_2).to be_invalid
  end

  it "should return a collection of patients(clients)" do
  	expect(doctor_1.clients).to eq([])
  end
end


describe "Patient" do
	let(:doctor_bob) {Doctor.create(name: "Dr. Bob")}
	let(:tom) {Patient.create(name: "Tom", email: "test@test.com", phone_number: "000-000-0000")}

	it "should have a collection of doctors" do
		tom.reload
		expect(tom).to respond_to(:doctors)
	end

	it "should require an name at creation" do
		tom.reload
		expect(tom.name).to eq("Tom")
	end

	it "should require an email at creation" do
		tom.reload
		expect(tom.email).to eq("test@test.com")
	end

	it "should require a phone number at creation" do
		tom.reload
		expect(tom.phone_number).to eq("000-000-0000")
	end
end


describe "Doctor Patient Relationship" do 
	let(:doctor_lisa) {Doctor.create(name: "Dr. Lisa", specialization: "Family Doctor")}
	let(:mike) {Patient.create(name: "Mike", email: "mike@test.com", phone_number: "000-000-0000")}
	let(:health_care) {DoctorPatientRelationship.create(doctor: doctor_lisa, patient: mike, primary_care: true)}
 
 	it "should specficy if the relationship is a primary care provider" do
 		expect(health_care.primary_care).to eq(true)
 	end

 	it "should have a specific doctor" do
 		health_care.reload
 		expect(health_care.doctor).to eq(doctor_lisa)
 	end

 	it "should have a specific patient" do
 		health_care.reload
 		expect(health_care.patient).to eq(mike)
 	end
end