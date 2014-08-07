# students
tom = Person.create(name: "Tom") 
pam = Person.create(name: "Pam")
bill = Person.create(name: "Bill")
sarah = Person.create(name: "Sarah")

#instructors
jim = Person.create(name: "Jim") 
kim = Person.create(name: "Kim") 
doug = Person.create(name: "Doug") 
hank = Person.create(name: "Hank")

#cohorts
bobolinks = Cohort.create(name: "Bobolinks", cohort_lead: jim)
salamanders = Cohort.create(name: "Salamanders", cohort_lead: kim)

#phases
b1 = Phase.create(student: tom, cohort: bobolinks, phase_lead: doug)
b2 = Phase.create(student: pam, cohort: bobolinks, phase_lead: hank)
s2 = Phase.create(student: bill, cohort: salamanders, phase_lead: hank)
s3 = Phase.create(student: sarah, cohort: salamanders, phase_lead: doug)