# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:uid) { |n| "uid#{n}" }
    email { "#{uid}@princeton.edu" }
    password { 'password' }
  end
end
