# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([
	{name: 'Socrates', uid: 1, provider: 'godmode'},
	{name: 'Shaun Masavage', organization: 'Edge Tech Labs', uid: 2, provider: 'seed', image_url: 'https://scontent-lax1-1.xx.fbcdn.net/hphotos-xta1/v/t1.0-9/11295567_10102127337265876_6155131625520089850_n.jpg?oh=dd7ae90a1eccb62fea1940f6cf1e2866&oe=565961EA'},
	{name: 'James Kinsella', organization: 'Desu box', uid: 3, provider: 'seed', image_url: 'https://scontent-lax1-1.xx.fbcdn.net/hphotos-xft1/v/t1.0-9/20627_408881632615271_287751988586816856_n.png?oh=7d29b3dab1be50808397dc0eae97ff7f&oe=56194E0D'},
	{name: 'Oleg Malenkov', organization: 'iblazr lab', uid: 4, provider: 'seed', image_url: 'https://scontent-lax1-1.xx.fbcdn.net/hphotos-xfp1/v/t1.0-9/10885299_10204397869378952_134260141009885551_n.jpg?oh=08e6f3a6b0f79557a6b4ecfab2d1acb9&oe=565243AD'},
])


posts = Post.create([
	
	{title: 'DrinkMate', description: 'After 2 years of development, were finally ready to release the iOS version of DrinkMate, the smallest breathalyzer in the world. DrinkMate is the next iteration of breathalyzer technology and we have made it affordable!',
	 image: 'https://ksr-ugc.imgix.net/assets/004/104/103/1c1db184dbbe87ae0a95789be8934321_original.jpg?v=1436219455&w=680&fit=max&auto=format&q=92&s=414cdf55266e60445cefb356fcc6ca6d',
	 user_id: 2, post_url: 'http://www.getdrinkmate.com'},

	 {title: 'Desu box', description: 'Desu box is a UK based monthly subscription box for Japanese sweets, snacks and drinks. We pack our box with as many goodies as we can, so we can offer the best value Japanese snack box in the UK! With delivery also available worldwide!',
	 image: 'https://ksr-ugc.imgix.net/projects/1929066/photo-original.png?v=1435923932&w=1024&h=768&fit=crop&auto=format&q=92&s=c49ff97585b3245cd71177d994e8212d',
	 user_id: 3, post_url: 'http://www.desubox.com/'},

	 {title: 'iblazr 2', description: 'The World’s Most Ultimate Wireless Flash for iPhone, iPad, Androids and Digital Cameras. Now synced with native camera apps.',
	 image: 'https://ksr-ugc.imgix.net/assets/004/003/008/65d467bcd3217611a4bd7f5bc15e8d03_original.jpg?v=1434622916&w=680&fit=max&auto=format&q=92&s=a80500baaa61f571cb520f137ef16fb3',
	 user_id: 3, post_url: 'http://iblazr.com/'},

])


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


