# frozen_string_literal: true

namespace :db do
  desc 'Loads the sample data from db/samples/**/*.rb'
  task sample: :skip_prod do
    Dir[Rails.root.join('db', 'sample', '**', '*.rb')].each { |f| load f }
  end
end