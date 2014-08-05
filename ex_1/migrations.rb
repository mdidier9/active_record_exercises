# Define your migrations here, they should take the form of:
#
# ActiveRecord::Migration.create_table :fruits do |t|
#   t.string :name
#   t.integer :bowl_id
# end
#
# Repeat the above template for each table you need to create

ActiveRecord::Migration.create_table :doctors do |t|
	t.string :name
	t.string :email
	t.string :phone_number
	t.string :specialization
	t.timestamps
end

ActiveRecord::Migration.create_table :patients do |t|
	t.string	:name
	t.string 	:email
	t.string 	:phone_number
	t.integer :doctor_id
	t.timestamps
end

ActiveRecord::Migration.create_table :doctor_patient_relationships do |t|
	t.integer	:doctor_id
	t.integer :patient_id
	t.boolean :primary_care
end