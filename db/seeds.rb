require 'faker'

# puts "delete all"
# Reminder.destroy_all
# Invoice.destroy_all
# Relationship.destroy_all
# Debtor.destroy_all
# User.destroy_all

# puts "creation ongoing"

# boris = User.create!(
#   email: "boris@toto.com",
#   password: "azeaze",
#   company_name: "Bistrot Groupe",
#   first_name: "Boris",
#   last_name: "Dupond",
#   phone_number: "06 06 06 06 06"
# )

# puts "user done"

# debtor1 = Debtor.create!(
#   company_name: "Anderson, Barrows and Boehm",
#   siren: "000000000"
# )

# # debtor2 = Debtor.create!(
# #   company_name: "BTP Group Paris",
# #   siren: "111111111"
# # )

# # debtor3 = Debtor.create!(
# #   company_name: "Payfit",
# #   siren: "222222222"
# # )

# # debtor4 = Debtor.create!(
# #   company_name: "SumUp",
# #   siren: "333333333"
# # )

# 5.times do
#   debtor = Debtor.new(
#     company_name: Faker::Company.name,
#     siren: Faker::Number.unique.number(digits: 9).to_s
#   )
#   debtor.save
# end

# puts "debtors creation done"

# # re1 = Relationship.new(
# #   rating: 4
# # )
# # re1.user = boris
# # re1.debtor = debtor1
# # re1.save

# # re2 = Relationship.new(
# #   rating: 2
# # )
# # re2.user = boris
# # re2.debtor = debtor2
# # re2.save

# # re3 = Relationship.new(
# #   rating: 3
# # )
# # re3.user = boris
# # re3.debtor = debtor3
# # re3.save

# # re4 = Relationship.new(
# #   rating: 1
# # )
# # re4.user = boris
# # re4.debtor = debtor4
# # re4.save

# 10.times do
#   relationship = Relationship.new(
#     rating: rand(1..5)
#   )
#   # Choisissez un utilisateur et un débiteur existant au hasard pour chaque relation
#   relationship.user = User.all.sample
#   relationship.debtor = Debtor.all.sample
#   relationship.save
# end

# puts "relationships creation done"

# def due_date(date)
#   date + 45
# end

# 10.times do
#   invoice = Invoice.new(
#     number: Faker::Invoice.reference,
#     amount: Faker::Number.between(from: 50, to: 500),
#     emission_date: Faker::Date.between(from: '2021-09-23', to: '2023-09-05'),
#     progress: ["À traiter", "Phase amiable", "Juridique", "Avant échéance", "Payé"].sample
#   )
#   invoice.due_date = due_date(invoice.emission_date)
#   invoice.relationship = Relationship.all.sample
#   invoice.save
# end
# # inv1 = Invoice.new(
# #   number: Faker::Invoice.reference,
# #   amount: 50,
# #   emission_date: Faker::Date.between(from: '2021-09-23', to: '2023-09-05'),
# #   progress: "À traiter"
# # )
# # inv1.due_date = due_date(inv1.emission_date)
# # inv1.relationship = re1
# # inv1.save

# # inv2 = Invoice.new(
# #   number: Faker::Invoice.reference,
# #   amount: 100,
# #   emission_date: Faker::Date.between(from: '2021-09-23', to: '2023-09-05'),
# #   progress: "Phase amiable"
# # )
# # inv2.due_date = due_date(inv2.emission_date)
# # inv2.relationship = re2
# # inv2.save

# # inv3 = Invoice.new(
# #   number: Faker::Invoice.reference,
# #   amount: 200,
# #   emission_date: Faker::Date.between(from: '2021-09-23', to: '2023-09-05'),
# #   progress: "Juridique"
# # )
# # inv3.due_date = due_date(inv3.emission_date)
# # inv3.relationship = re2
# # inv3.save

# # inv4 = Invoice.new(
# #   number: Faker::Invoice.reference,
# #   amount: 100,
# #   emission_date: Faker::Date.between(from: '2021-09-23', to: '2023-09-05'),
# #   progress: "Avant échéance"
# # )
# # inv4.due_date = due_date(inv4.emission_date)
# # inv4.relationship = re1
# # inv4.save

# # inv5 = Invoice.new(
# #   number: Faker::Invoice.reference,
# #   amount: 100,
# #   emission_date: '2023-07-23',
# #   payment_date: '2023-10-30',
# #   progress: "Payé"
# # )
# # inv5.due_date = due_date(inv5.emission_date)
# # inv5.relationship = re2
# # inv5.save

# # inv6 = Invoice.new(
# #   number: Faker::Invoice.reference,
# #   amount: 400,
# #   emission_date: '2023-05-23',
# #   payment_date: '2023-06-30',
# #   progress: "Payé"
# # )
# # inv6.due_date = due_date(inv6.emission_date)
# # inv6.relationship = re1
# # inv6.save
# puts "invoices creation done"

# # remind1 = Reminder.new(
# #   reminder_type: "email",
# #   action_date: '2022-12-31',
# #   progress: "En cours"
# # )
# # remind1.invoice = inv1
# # remind1.save
# 50.times do
#   remind = Reminder.new(
#     reminder_type: "email",
#     action_date: Faker::Date.between(from: '2022-01-01', to: '2023-12-31'),
#     progress: ["En cours", "Terminé"].sample
#   )
#   # Choisissez une facture existante aléatoire à laquelle lier le rappel
#   remind.invoice = Invoice.all.sample
#   remind.save
# end

# puts "reminders creation done"

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

5.times do
  debtor = Debtor.new(
    company_name: Faker::Company.name,
    siren: Faker::Number.unique.number(digits: 9).to_s
  )
  debtor.save
end

puts "debtors creation done"

# 10.times do
#   relationship = Relationship.new(
#     rating: rand(1..5)
#   )
#   relationship.user = boris

Debtor.all.each do |debtor|
  relationship = Relationship.new
  relationship.rating = rand(1..5)
  relationship.user = boris
  relationship.debtor = debtor
  relationship.save
end

puts "relationships creation done"

def due_date(date)
  date + 45
end

10.times do
  invoice = Invoice.new(
    number: Faker::Invoice.reference,
    amount: Faker::Number.between(from: 50, to: 500),
    emission_date: Faker::Date.between(from: '2021-09-23', to: '2023-09-05'),
    progress: ["À traiter", "Phase amiable", "Juridique", "Avant échéance"].sample
  )
  invoice.due_date = due_date(invoice.emission_date)
  invoice.relationship = Relationship.all.sample
  invoice.save
end

5.times do
  invoice = Invoice.new(
    number: Faker::Invoice.reference,
    amount: Faker::Number.between(from: 50, to: 500),
    emission_date: Faker::Date.between(from: '2021-09-23', to: '2023-09-05'),
    progress: "Payé"
  )
  invoice.due_date = due_date(invoice.emission_date)
  invoice.relationship = Relationship.all.sample
  invoice.save
end

puts "invoices creation done"

50.times do
  remind = Reminder.new(
    reminder_type: "email",
    action_date: Faker::Date.between(from: '2022-01-01', to: '2023-12-31'),
    progress: ["En cours", "Terminé"].sample
  )
  remind.invoice = Invoice.all.sample
  remind.save
end

puts "reminders creation done"
