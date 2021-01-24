# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name: "Nappa", email: "nappa@dappa.com", password: "123456", password_confirmation: "123456")
User.create(name: "Vegeta", email: "vegeta@saiyan.com", password: "123456", password_confirmation: "123456")
User.create(name: "Hoppie", email: "hoppie@doppie.com", password: "123456", password_confirmation: "123456")

Group.create(user_id: 1, name: "Amazon")
Group.create(user_id: 1, name: "Takealot")
Group.create(user_id: 2, name: "Ebay")
Group.create(user_id: 2, name: "Amazon")
Group.create(user_id: 3, name: "Beer")

Expense.create(author_id: 1, name: "Snuggie", amount: 25)
Expense.create(author_id: 1, name: "Beanboozle", amount: 10)
Expense.create(author_id: 1, name: "Plushy", amount: 60)
Expense.create(author_id: 2, name: "Hello Kitty onesie", amount: 20)
Expense.create(author_id: 2, name: "Illegal chimpanzee", amount: 200)
Expense.create(author_id: 3, name: "Pypie", amount: 0.05)

GroupExpense.create(group_id: 1, expense_id: 1)
GroupExpense.create(group_id: 1, expense_id: 2)
GroupExpense.create(group_id: 2, expense_id: 3)
GroupExpense.create(group_id: 4, expense_id: 4)
GroupExpense.create(group_id: 4, expense_id: 5)
GroupExpense.create(group_id: 5, expense_id: 6)