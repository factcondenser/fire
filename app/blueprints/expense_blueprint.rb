# frozen_string_literal: true

class ExpenseBlueprint < Blueprinter::Base
  identifier :id

  fields :amount, :description, :expense_category, :created_at, :updated_at
end
