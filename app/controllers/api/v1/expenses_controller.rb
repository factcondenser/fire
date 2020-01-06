# frozen_string_literal: true

module Api
  module V1
    class ExpensesController < ApiController
      before_action :load_expense, only: %i[show update destroy]
      before_action :load_expense_categories, only: %i[create update]

      # GET /api/v1/expenses
      def index
        @expenses = Expense.all
      end

      # GET /api/v1/expenses/1
      def show; end

      # POST /api/v1/expenses
      def create
        @expense = Expense.create(expense_params)
        respond_with @expense
      end

      # PATCH/PUT /api/v1/expenses/1
      def update
        @expense.update(expense_params)
        respond_with @expense, json: @expense
      end

      # DELETE /api/v1/expenses/1
      def destroy
        @expense.destroy
        respond_with @expense, json: @expense
      end

      private

      def load_expense
        @expense = Expense.find(params[:id])
      end

      def load_expense_categories
        @expense_categories = ExpenseCategory.all
      end

      def expense_params
        params.require(:expense).permit(:expense_category_id, :amount, :description)
      end
    end
  end
end
