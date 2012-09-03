# encoding: UTF-8

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

Refinery::Elections::ElectionType.create([{ name: 'Prezidentské volby' }, 
  { name: 'Senátní volby' }, { name: 'Krajské volby' }])

Refinery::Emails::Email.create([
  { title: 'Keepers Registration Subject', content: 'Message', for: 'keepers_registration' }, 
  { title: 'Citizens Registration Subject', content: 'Message', for: 'citizens_registration' }
])

Refinery::Counties::County.create([{ name: 'Brno' }, {name: 'Praha' }])

# ONLY FOR TESTING

Refinery::Elections::Election.create([
  { election_type_id: 1, held: '2012-09-21' },
  { election_type_id: 2, held: '2012-10-12' }
])

Refinery::Keepers::Keeper.create([
  { firstname: 'Josef', lastname: 'Dlouhý', email: 'dlouhy@mail.com', password: '123456', password_confirmation: '123456', activation_code: nil },
  { firstname: 'Anna', lastname: 'Schmidt', email: 'schmidt@mail.com', password: '123456', password_confirmation: '123456', activation_code: nil }
])

Refinery::Politicians::Politician.create([
  { firstname: 'George', lastname: 'Vonn', keeper_id: 1 }  
])

Refinery::Parties::Party.create([
  { name: 'OBSD', keeper_id: 2 }
])

ElectionSubjectElection.create([
  { subject_id: 1, election_id: 1 },
  { subject_id: 2, election_id: 2 }
])

Refinery::Questions::Question.create([
  { title: 'Lorem ipsum', content: 'Dolor sit amet.', election_id: 1, subject_id: 1 },
  { title: 'Another question', content: 'Lorem ipsum dolor sit consecetur elis.', election_id: 1, subject_id: 1 },
  { title: 'Otázka do senátnich voleb', content: 'Tělo otázky do senátnich voleb', election_id: 2, subject_id: 2 }
])