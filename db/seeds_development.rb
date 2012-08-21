Refinery::Elections::Election.create([
  { election_type_id: 1, held: '2012-09-09'},
  { election_type_id: 2, held: '2012-10-09'},
  { election_type_id: 3, held: '2012-12-05'}
])

Refinery::Politicians::Politician.create([
  { keeper_id: 1, election_id: 1, firstname: 'George', lastname: 'Bush' },
  { keeper_id: 2, election_id: 1, firstname: 'Bill', lastname: 'Clinton' },
  { keeper_id: 3, election_id: 1, firstname: 'George', lastname: 'Washington' },
  { keeper_id: 4, election_id: 1, firstname: 'Barack', lastname: 'Obama' }
])

Refinery::Keepers::Keeper.create([
  { firstname: 'Marek', lastname: 'Takáč', email: 'takac@mail.com', password: '123456',
    password_confirmation: '123456' },
  { firstname: 'Keram', lastname: 'Cakat', email: 'cakat@mail.com', password: '123456',
    password_confirmation: '123456' },
  { firstname: 'Jirka', lastname: 'Rychlý', email: 'rychly@mail.com', password: '123456',
    password_confirmation: '123456' },
  { firstname: 'Radovan', lastname: 'Procházka', email: 'prochazka@mail.com', password: '123456',
    password_confirmation: '123456' }
])

Refinery::Questions::Question.create([
  { title: 'Otázka 1', content: 'Lorem ipsum dolor sit amet consecetur elis ob anima',
    election_id: 1, subject_id: 1 },
  { title: 'Otázka 2', content: 'Lorem ipsum dolor sit amet consecetur elis ob anima',
    election_id: 1, subject_id: 2 },
  { title: 'Otázka 3', content: 'Lorem ipsum dolor sit amet consecetur elis ob anima',
    election_id: 1, subject_id: 1 },
  { title: 'Otázka 4', content: 'Lorem ipsum dolor sit amet consecetur elis ob anima',
    election_id: 1, subject_id: 3 }
])