# frozen_string_literal: true

%w[db:drop db:reset db:seed].each do |t|
  Rake::Task[t].enhance ['skip_prod']
end
