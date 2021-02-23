# frozen_string_literal: true

FactoryBot.define do
  factory :player do
    last_name { FFaker::Name.last_name }
    
    team
  end
end