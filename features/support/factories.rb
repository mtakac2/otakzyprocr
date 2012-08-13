require 'factory_girl'

FactoryGirl.define do
  factory :admin, class: 'Refinery::User' do |admin|
    admin.username              'admin'
    admin.email                 'admin@mail.com'
    admin.password              'admin_password'
    admin.password_confirmation 'admin_password'
  end

  factory :question, class: 'Refinery::Questions::Question' do |question|
    question.title   'Lorem ipsum'
    question.content 'Dolor sit amet'

    association :election, strategy: :build    
  end

  factory :election, class: 'Refinery::Elections::Election' do |election|
    election.held '2012-09-09'

    association :election_type
  end

  factory :election_type, class: 'Refinery::Elections::ElectionType' do |et|
    name 'Prezidentske volby'
  end

  factory :politician, class: 'Refinery::Politicians::Politician' do |politician|
    politician.firstname 'Barack'
    politician.lastname  'Obama'

    association :keeper, factory: :politician_keeper, strategy: :build
  end

  factory :politician_keeper, class: 'Refinery::Keepers::Keeper' do |politician_keeper|
    politician_keeper.firstname             'George'
    politician_keeper.lastname              'Vonn'
    politician_keeper.email                 'vonn@mail.com'
    politician_keeper.password              '123456'
    politician_keeper.password_confirmation '123456'
    politician_keeper.street                'Brown Street'
    politician_keeper.street_number         22
    politician_keeper.postal_code           '100 00'
    politician_keeper.city                  'London'
    politician_keeper.phone                 '+100 20 56 98'
    politician_keeper.activation_code       '0OfSJUAkNyIj-ce8CSrrX7cieCFDHAc1EPjMBM-dsxRtS9PGlORiVoc-bsyf5Up4TogrZWu8MVNNzkW346Vuag'
  end
end