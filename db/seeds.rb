# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.create(
	name: 'Socrates',
	uid: 1,
	provider: 'godmode')


categories = Category.create([
	{ name: 'Art & Design' },
	{ name: 'Business' },
	{ name: 'Education' },
	{ name: 'Engineering' },
	{ name: 'Entertainment' },
	{ name: 'Finance' },
	{ name: 'Fitness' },
	{ name: 'Food' },
	{ name: 'Medicine' },
	{ name: 'Music' },
	{ name: 'Non-Profit' },	
	{ name: 'Programming' },
	{ name: 'Retail' },
	{ name: 'Science & Bio-Tech' },
	{ name: 'Technology' },
	])




