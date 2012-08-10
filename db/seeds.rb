# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Added by Refinery CMS Pages extension
Refinery::Pages::Engine.load_seed
# Added by Refinery CMS Counties extension
Refinery::Counties::Engine.load_seed

# Added by Refinery CMS Citizens extension
Refinery::Citizens::Engine.load_seed

# Added by Refinery CMS Keepers extension
Refinery::Keepers::Engine.load_seed

# Added by Refinery CMS Politicians extension
Refinery::Politicians::Engine.load_seed

# Added by Refinery CMS Parties extension
Refinery::Parties::Engine.load_seed

# Added by Refinery CMS Elections extension
Refinery::Elections::Engine.load_seed

# Added by Refinery CMS Questions extension
Refinery::Questions::Engine.load_seed

# Added by Refinery CMS Emails extension
Refinery::Emails::Engine.load_seed

Refinery::Counties::County.create([{ name: 'Brno' }, {name: 'Praha' }])