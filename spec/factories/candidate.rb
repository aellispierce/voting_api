FactoryGirl.define do
  factory :candidate do
    name 'New Candidate'
    party 'Democrat'
  end

  FactoryGirl.create :candidate
