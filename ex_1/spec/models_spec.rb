require_relative '../app'

describe Doctor do
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


describe Patient do
  let(:doctor_bob) {Doctor.create(name: "Dr. Bob", specialization: "Internal Medicine")}
  let(:doctor_sue) {Doctor.create(name: "Dr. Sue", specialization: "Radiology")}
  let(:tom) {Patient.create(name: "Tom",
                            email: "tom@example.com",
                            phone_number: "000-000-0000")}
  let(:mark) {Patient.create(name: "Mark",
                             email: "mark@example.com",
                             phone_number: "000-000-0000")}

  before do
    tom.doctors << doctor_bob
    tom.doctors << doctor_sue

    mark.doctors << doctor_sue
  end

  it "should have a collection of doctors" do
    # reload the Doctor tom to ensure the collection of doctors
    # was persisted
    tom.reload

    expect(tom.doctors).to match_array [doctor_bob, doctor_sue]
  end

  it "should list patients for a particular doctor" do
    # reload the Doctor tom to ensure the collection of doctors
    # was persisted
    doctor_sue.reload

    expect(doctor_sue.clients).to match_array [tom, mark]
  end
end


describe DoctorPatientRelationship do
  let(:doctor_lisa) {Doctor.create(name: "Dr. Lisa",
                                   specialization: "Family Doctor")}
  let(:mike) {Patient.create(name: "Mike",
                             email: "mike@test.com",
                             phone_number: "000-000-0000")}
  let(:relationship) {DoctorPatientRelationship.create(doctor: doctor_lisa,
                                                       patient: mike,
                                                       primary_care: true)}

  before do
   relationship.reload
  end

  it "should have a specific doctor" do
    expect(relationship.doctor).to eq(doctor_lisa)
  end

  it "should have a specific patient" do
    expect(relationship.patient).to eq(mike)
  end

  it "should be possible to find the relationships for a patient" do
    expect(mike.doctor_patient_relationships).to eq [relationship]
  end

  it "should be possible to find the relationships for a doctor" do
    expect(doctor_lisa.doctor_patient_relationships).to eq [relationship]
  end
end