# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#User.create!(email: 'admin@glbrc.org', password: 'secret', password_confirmation: 'secret')

Page.create!(title: 'home', description: 'Root homepage from icon link', content: '
<p><img src="/header_logo.png" style="width: 100%"><br></p>
<pre>This site is under development</pre>
<hr>')
Page.create!(title: 'downloads', description: 'Bulk download link on top navbar', content:'<h1>Downloads</h1><hr>')
Page.create!(title: 'help', description: 'Help page docs on user dropdown', content:'<h1>Help</h1><hr>')
Page.create!(title: 'about', description: 'About page details on user dropdown', content:'<h1>About PhyloFAdb</h1><hr>')
Page.create!(title: 'contact', description: 'Contact information on user dropdown', content:'<h1>Contact</h1><hr>')