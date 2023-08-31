require 'faker'

# puts "delete all"

# Reminder.destroy_all
# Invoice.destroy_all
# Debtor.destroy_all
# User.destroy_all
# Relationship.destroy_all

# puts "creation ongoing"

# boris = User.create!(
#   email: "boris@toto.com",
#   password: "azeaze",
#   company_name: "Bistrot Groupe",
#   first_name: "Boris",
#   last_name: "Dupond",
#   phone_number: "06 06 06 06 06"
# )

# jane = User.create!(
#   email: "jane@titi.com",
#   password: "azeaze",
#   company_name: "Evenements Groupe",
#   first_name: "Jane",
#   last_name: "Smith",
#   phone_number: "07 07 07 07 07"
# )
# puts "user creation done"

# debtor1 = Debtor.create!(
#   company_name: "Anderson, Barrows and Boehm",
#   siren: "000000000"
# )

# debtor2 = Debtor.create!(
#   company_name: "Mertz Group",
#   siren: "111111111"
# )

# debtor3 = Debtor.create!(
#   company_name: "Turcotte, Lehner and Labadie",
#   siren: "222222222"
# )

# debtor4 = Debtor.create!(
#   company_name: "Stark-Renner",
#   siren: "333333333"
# )

# puts "debtors creation done"

# re1 = Relationship.new(
#   rating: 3
# )
# re1.user = boris
# re1.debtor = debtor1
# re1.save

# re2 = Relationship.new(
#   rating: 3
# )
# re2.user = boris
# re2.debtor = debtor2
# re2.save

# re3 = Relationship.new(
#   rating: 3
# )
# re3.user = jane
# re3.debtor = debtor3
# re3.save

# re4 = Relationship.new(
#   rating: 4
# )
# re4.user = jane
# re4.debtor = debtor4
# re4.save

# puts "relationships creation done"

# def due_date(date)
#   date + 45
# end

# inv1 = Invoice.new(
#   number: Faker::Invoice.reference,
#   amount: 50,
#   emission_date: Faker::Date.between(from: '2021-09-23', to: '2023-09-05'),
#   progress: "À traiter"
# )
# inv1.due_date = due_date(inv1.emission_date)
# inv1.relationship = re1
# inv1.save

# inv2 = Invoice.new(
#   number: Faker::Invoice.reference,
#   amount: 100,
#   emission_date: Faker::Date.between(from: '2021-09-23', to: '2023-09-05'),
#   progress: "À traiter"
# )
# inv2.due_date = due_date(inv2.emission_date)
# inv2.relationship = re1
# inv2.save

# inv7 = Invoice.new(
#   number: Faker::Invoice.reference,
#   amount: 50,
#   emission_date: Faker::Date.between(from: '2021-09-23', to: '2023-09-05'),
#   progress: "À traiter"
# )
# inv7.due_date = due_date(inv7.emission_date)
# inv7.relationship = re2
# inv7.save

# inv8 = Invoice.new(
#   number: Faker::Invoice.reference,
#   amount: 100,
#   emission_date: Faker::Date.between(from: '2021-09-23', to: '2023-09-05'),
#   progress: "À traiter"
# )
# inv8.due_date = due_date(inv8.emission_date)
# inv8.relationship = re2
# inv8.save

# puts "invoices creation done"

# remind1 = Reminder.new(
#   reminder_type: "email",
#   action_date: '2022-12-31',
#   progress: "En cours"
# )
# remind1.invoice_id = inv1.id
# remind1.save

# remind2 = Reminder.new(
#   reminder_type: "email",
#   action_date: '2022-12-31',
#   progress: "En cours"
# )
# remind2.invoice_id = inv2.id
# remind2.save

# remind3 = Reminder.new(
#   reminder_type: "téléphone",
#   action_date: '2022-12-31',
#   progress: "Rappel avant échéance"
# )
# remind3.invoice_id = inv7.id
# remind3.save

# remind4 = Reminder.new(
#   reminder_type: "email",
#   action_date: '2022-12-31',
#   progress: "En cours"
# )
# remind4.invoice_id = inv8.id
# remind4.save

# puts "reminder creation done"

puts "delete all"
Reminder.destroy_all
Invoice.destroy_all
Relationship.destroy_all
Debtor.destroy_all
User.destroy_all

puts "creation ongoing"

boris = User.create!(
  email: "boris@toto.com",
  password: "azeaze",
  company_name: "Bistrot Groupe",
  first_name: "Boris",
  last_name: "Dupond",
  phone_number: "06 06 06 06 06"
)

puts "user done"

debtor1 = Debtor.create!(
  company_name: "Anderson, Barrows and Boehm",
  siren: "000000000"
)

debtor2 = Debtor.create!(
  company_name: "BTP Group Paris",
  siren: "111111111"
)

puts "debtors creation done"

re1 = Relationship.new(
  rating: 4
)
re1.user = boris
re1.debtor = debtor1
re1.save

re2 = Relationship.new(
  rating: 2
)
re2.user = boris
re2.debtor = debtor2
re2.save

puts "relationships creation done"

def due_date(date)
  date + 45
end

inv1 = Invoice.new(
  number: Faker::Invoice.reference,
  amount: 50,
  emission_date: Faker::Date.between(from: '2021-09-23', to: '2023-09-05'),
  progress: "À traiter"
)
inv1.due_date = due_date(inv1.emission_date)
inv1.relationship = re1
inv1.save

inv2 = Invoice.new(
  number: Faker::Invoice.reference,
  amount: 100,
  emission_date: Faker::Date.between(from: '2021-09-23', to: '2023-09-05'),
  progress: "Phase amiable"
)
inv2.due_date = due_date(inv2.emission_date)
inv2.relationship = re2
inv2.save

inv3 = Invoice.new(
  number: Faker::Invoice.reference,
  amount: 200,
  emission_date: Faker::Date.between(from: '2021-09-23', to: '2023-09-05'),
  progress: "Juridique"
)
inv3.due_date = due_date(inv3.emission_date)
inv3.relationship = re2
inv3.save

inv4 = Invoice.new(
  number: Faker::Invoice.reference,
  amount: 100,
  emission_date: Faker::Date.between(from: '2021-09-23', to: '2023-09-05'),
  progress: "Avant échéance"
)
inv4.due_date = due_date(inv4.emission_date)
inv4.relationship = re1
inv4.save


inv5 = Invoice.new(
  number: Faker::Invoice.reference,
  amount: 100,
  emission_date: Faker::Date.between(from: '2021-09-23', to: '2023-09-05'),
  progress: "Payé"
)
inv5.due_date = due_date(inv5.emission_date)
inv5.relationship = re1
inv5.save

puts "invoices creation done"

remind1 = Reminder.new(
  reminder_type: "email",
  action_date: '2022-12-31',
  progress: "En cours"
)
remind1.invoice = inv1
remind1.save
