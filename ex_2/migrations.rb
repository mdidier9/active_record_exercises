# Define your migrations here, they should take the form of:
#
# ActiveRecord::Migration.create_table :fruits do |t|
#   t.string :name
#   t.integer :bowl_id
# end
#
# Repeat the above template for each table you need to create

ActiveRecord::Migration.create_table :people do |t|
  t.string :name
  t.timestamps
end

ActiveRecord::Migration.create_table :cohorts do |t|
  t.string :name
  t.integer :cohort_lead_id
  t.timestamps
end

ActiveRecord::Migration.create_table :phases do |t| #Join
  t.integer :student_id
  t.integer :cohort_id
  t.integer :phase_lead_id
  t.string  :name  
  t.timestamps
end

