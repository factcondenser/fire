# frozen_string_literal: true

namespace :db do
  desc 'Loads the sample data from db/samples/**/*.rb'
  task sample: %i[skip_prod seed] do
    Dir[Rails.root.join('db', 'sample', '**', '*.rb')].sort.each { |f| load f }
  end
end
