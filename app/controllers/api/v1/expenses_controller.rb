# frozen_string_literal: true

module Api
  module V1
    class ExpensesController < ApiController
      before_action :load_expense, only: %i[show update destroy]
      before_action :load_expense_categories, only: %i[create update]

      # GET /api/v1/expenses
      def index
        @expenses = current_user.expenses
        render json: ExpenseBlueprint.render(@expenses)
      end

      # GET /api/v1/expenses/1
      def show
        render json: ExpenseBlueprint.render(@expense)
      end

      # POST /api/v1/expenses
      def create
        @expense = current_user.expenses.create(expense_params)
        render json: ExpenseBlueprint.render(@expense)
      end

      # PATCH/PUT /api/v1/expenses/1
      def update
        @expense.update(expense_params)
        render json: ExpenseBlueprint.render(@expense)
      end

      # DELETE /api/v1/expenses/1
      def destroy
        @expense.destroy
      end

      private

      def load_expense
        @expense = current_user.expenses.find(params[:id])
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
