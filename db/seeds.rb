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
  company_name: "Anderson, Barrows and Boehm",
  siren: "559885116"
)

debtor2 = Debtor.create!(
  company_name: "Mertz Group",
  siren: "915094916"
)

debtor3 = Debtor.create!(
  company_name: "Turcotte, Lehner and Labadie",
  siren: "741426332"
)

debtor4 = Debtor.create!(
  company_name: "Stark-Renner",
  siren: "964247357"
)

debtor5 = Debtor.create!(
  company_name: "Boyer, Johns and Goodwin",
  siren: "071269476"
)

puts "debtors creation done"

def due_date(date)
  date + 45
end

inv1 = Invoice.new(
  number: Faker::Invoice.reference,
  amount: Faker::Number.decimal(l_digits: 2),
  emission_date: Faker::Date.between(from: '2021-09-23', to: '2023-09-05'),
  progress: "À traiter"
)
inv1.due_date = due_date(inv1.emission_date)
inv1.user = boris
inv1.debtor = debtor1
inv1.save

inv2 = Invoice.new(
  number: Faker::Invoice.reference,
  amount: Faker::Number.decimal(l_digits: 2),
  emission_date: Faker::Date.between(from: '2021-09-23', to: '2023-09-05'),
  progress: "À traiter"
)
inv2.due_date = due_date(inv2.emission_date)
inv2.user = boris
inv2.debtor = debtor1
inv2.save

inv7 = Invoice.new(
  number: Faker::Invoice.reference,
  amount: Faker::Number.decimal(l_digits: 2),
  emission_date: Faker::Date.between(from: '2021-09-23', to: '2023-09-05'),
  progress: "À traiter"
)
inv7.due_date = due_date(inv7.emission_date)
inv7.user = boris
inv7.debtor = debtor2
inv7.save

inv8 = Invoice.new(
  number: Faker::Invoice.reference,
  amount: Faker::Number.decimal(l_digits: 2),
  emission_date: Faker::Date.between(from: '2021-09-23', to: '2023-09-05'),
  progress: "À traiter"
)
inv8.due_date = due_date(inv8.emission_date)
inv8.user = boris
inv8.debtor = debtor2
inv8.save

inv9 = Invoice.new(
  number: Faker::Invoice.reference,
  amount: Faker::Number.decimal(l_digits: 2),
  emission_date: Faker::Date.between(from: '2021-09-23', to: '2023-09-05'),
  progress: "Phase amiable"
)
inv9.due_date = due_date(inv9.emission_date)
inv9.user = boris
inv9.debtor = debtor1
inv9.save

inv10 = Invoice.new(
  number: Faker::Invoice.reference,
  amount: Faker::Number.decimal(l_digits: 2),
  emission_date: Faker::Date.between(from: '2021-09-23', to: '2023-09-05'),
  progress: "À traiter"
)
inv10.due_date = due_date(inv10.emission_date)
inv10.user = boris
inv10.debtor = debtor2
inv10.save

inv11 = Invoice.new(
  number: Faker::Invoice.reference,
  amount: Faker::Number.decimal(l_digits: 2),
  emission_date: Faker::Date.between(from: '2021-09-23', to: '2023-09-05'),
  progress: "À traiter"
)
inv11.due_date = due_date(inv11.emission_date)
inv11.user = boris
inv11.debtor = debtor3
inv11.save

inv12 = Invoice.new(
  number: Faker::Invoice.reference,
  amount: Faker::Number.decimal(l_digits: 2),
  emission_date: Faker::Date.between(from: '2021-09-23', to: '2023-09-05'),
  progress: "À traiter"
)
inv12.due_date = due_date(inv12.emission_date)
inv12.user = boris
inv12.debtor = debtor3
inv12.save

inv3 = Invoice.new(
  number: Faker::Invoice.reference,
  amount: Faker::Number.decimal(l_digits: 2),
  emission_date: Faker::Date.between(from: '2021-09-23', to: '2023-09-05'),
  progress: "Phase amiable"
)
inv3.due_date = due_date(inv3.emission_date)
inv3.user = jane
inv3.debtor = debtor2
inv3.save

inv4 = Invoice.new(
  number: Faker::Invoice.reference,
  amount: Faker::Number.decimal(l_digits: 2),
  emission_date: Faker::Date.between(from: '2021-09-23', to: '2023-09-05'),
  progress: "Avant échéance"
)
inv4.due_date = due_date(inv4.emission_date)
inv4.user = jane
inv4.debtor = debtor2
inv4.save

inv5 = Invoice.new(
  number: Faker::Invoice.reference,
  amount: Faker::Number.decimal(l_digits: 2),
  emission_date: Faker::Date.between(from: '2021-09-23', to: '2023-09-05'),
  progress: "Phase amiable"
)
inv5.due_date = due_date(inv5.emission_date)
inv5.user = dorian
inv5.debtor = debtor3
inv5.save

inv6 = Invoice.new(
  number: Faker::Invoice.reference,
  amount: Faker::Number.decimal(l_digits: 2),
  emission_date: Faker::Date.between(from: '2021-09-23', to: '2023-09-05'),
  progress: "Juridique"
)
inv6.due_date = due_date(inv6.emission_date)
inv6.user = dorian
inv6.debtor = debtor3
inv6.save

inv13 = Invoice.new(
  number: Faker::Invoice.reference,
  amount: Faker::Number.decimal(l_digits: 2),
  emission_date: Faker::Date.between(from: '2021-09-23', to: '2023-09-05'),
  progress: "À traiter"
)
inv13.due_date = due_date(inv13.emission_date)
inv13.user = jane
inv13.debtor = debtor3
inv13.save

inv14 = Invoice.new(
  number: Faker::Invoice.reference,
  amount: Faker::Number.decimal(l_digits: 2),
  emission_date: Faker::Date.between(from: '2021-09-23', to: '2023-09-05'),
  progress: "Phase amiable"
)
inv14.due_date = due_date(inv14.emission_date)
inv14.user = boris
inv14.debtor = debtor3
inv14.save

inv15 = Invoice.new(
  number: Faker::Invoice.reference,
  amount: Faker::Number.decimal(l_digits: 2),
  emission_date: Faker::Date.between(from: '2021-09-23', to: '2023-09-05'),
  progress: "À traiter"
)
inv15.due_date = due_date(inv15.emission_date)
inv15.user = boris
inv15.debtor = debtor1
inv15.save

inv16 = Invoice.new(
  number: Faker::Invoice.reference,
  amount: Faker::Number.decimal(l_digits: 2),
  emission_date: Faker::Date.between(from: '2021-09-23', to: '2023-09-05'),
  progress: "À traiter"
)
inv16.due_date = due_date(inv16.emission_date)
inv16.user = boris
inv16.debtor = debtor1
inv16.save

inv17 = Invoice.new(
  number: Faker::Invoice.reference,
  amount: Faker::Number.decimal(l_digits: 2),
  emission_date: Faker::Date.between(from: '2021-09-23', to: '2023-09-05'),
  progress: "À traiter"
)
inv17.due_date = due_date(inv17.emission_date)
inv17.user = boris
inv17.debtor = debtor3
inv17.save

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

remind4 = Reminder.new(
  reminder_type: "email",
  action_date: '2022-12-31',
  progress: "En cours"
)
remind4.invoice_id = inv9.id
remind4.save

remind5 = Reminder.new(
  reminder_type: "email",
  action_date: '2022-12-31',
  progress: "En cours"
)
remind5.invoice_id = inv14.id
remind5.save

remind6 = Reminder.new(
  reminder_type: "téléphone",
  action_date: '2022-12-31',
  progress: "Rappel avant échéance"
)
remind6.invoice_id = inv14.id
remind6.save

puts "reminder creation done"
