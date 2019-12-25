json.extract! expense, :id, :created_at, :updated_at, :expense_category, :amount, :description
json.url expense_url(expense, format: :json)
