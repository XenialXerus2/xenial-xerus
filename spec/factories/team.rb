# frozen_string_literal: true

FactoryBot.define do
  factory :team do
    name { FFaker::AnimalUS.common_name.pluralize }
  end
end