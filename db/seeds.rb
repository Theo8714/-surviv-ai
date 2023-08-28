require 'faker'

puts "delete all"

Reminder.destroy_all
Invoice.destroy_all
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

jane = User.create!(
  email: "jane@titi.com",
  password: "azeaze",
  company_name: "Evenements Groupe",
  first_name: "Jane",
  last_name: "Smith",
  phone_number: "07 07 07 07 07"
)

dorian = User.create!(
  email: "dorian@titi.com",
  password: "azeaze",
  company_name: "BTP Groupe",
  first_name: "Dorian",
  last_name: "Bouleau",
  phone_number: "07 06 06 06 07"
)

puts "user creation done"

debtor1 = Debtor.create!(
  company_name: Faker::Company.name,
  siren: Faker::Company.french_siren_number
)

debtor2 = Debtor.create!(
  company_name: Faker::Company.name,
  siren: Faker::Company.french_siren_number
)

debtor3 = Debtor.create!(
  company_name: Faker::Company.name,
  siren: Faker::Company.french_siren_number
)

puts "debtors creation done"

def payment_date(date)
  date + 45
end

inv1 = Invoice.new(
  number: Faker::Invoice.reference,
  amount: Faker::Number.decimal(l_digits: 2),
  emission_date: Faker::Date.between(from: '2021-09-23', to: '2023-09-05'),
  progress: "À traiter"
)
inv1.payment_date = payment_date(inv1.emission_date)
inv1.user = boris
inv1.debtor = debtor1
inv1.save

inv2 = Invoice.new(
  number: Faker::Invoice.reference,
  amount: Faker::Number.decimal(l_digits: 2),
  emission_date: Faker::Date.between(from: '2021-09-23', to: '2023-09-05'),
  progress: "À traiter"
)
inv2.payment_date = payment_date(inv2.emission_date)
inv2.user = boris
inv2.debtor = debtor1
inv2.save

inv3 = Invoice.new(
  number: Faker::Invoice.reference,
  amount: Faker::Number.decimal(l_digits: 2),
  emission_date: Faker::Date.between(from: '2021-09-23', to: '2023-09-05'),
  progress: "Phase amiable"
)
inv3.payment_date = payment_date(inv3.emission_date)
inv3.user = jane
inv3.debtor = debtor2
inv3.save

inv4 = Invoice.new(
  number: Faker::Invoice.reference,
  amount: Faker::Number.decimal(l_digits: 2),
  emission_date: Faker::Date.between(from: '2021-09-23', to: '2023-09-05'),
  progress: "Avant échéance"
)
inv4.payment_date = payment_date(inv4.emission_date)
inv4.user = jane
inv4.debtor = debtor2
inv4.save

inv5 = Invoice.new(
  number: Faker::Invoice.reference,
  amount: Faker::Number.decimal(l_digits: 2),
  emission_date: Faker::Date.between(from: '2021-09-23', to: '2023-09-05'),
  progress: "Phase amiable"
)
inv5.payment_date = payment_date(inv5.emission_date)
inv5.user = dorian
inv5.debtor = debtor3
inv5.save

inv6 = Invoice.new(
  number: Faker::Invoice.reference,
  amount: Faker::Number.decimal(l_digits: 2),
  emission_date: Faker::Date.between(from: '2021-09-23', to: '2023-09-05'),
  progress: "Juridique"
)
inv6.payment_date = payment_date(inv6.emission_date)
inv6.user = dorian
inv6.debtor = debtor3
inv6.save

puts "invoices creation done"

remind1 = Reminder.new(
  reminder_type: "email",
  action_date: '2022-12-31',
  progress: "En cours"
)
remind1.invoice_id = inv3.id
remind1.save

remind2 = Reminder.new(
  reminder_type: "email",
  action_date: '2022-12-31',
  progress: "En cours"
)
remind2.invoice_id = inv3.id
remind2.save

remind3 = Reminder.new(
  reminder_type: "téléphone",
  action_date: '2022-12-31',
  progress: "Rappel avant échéance"
)
remind3.invoice_id = inv5.id
remind3.save

puts "reminder creation done"
