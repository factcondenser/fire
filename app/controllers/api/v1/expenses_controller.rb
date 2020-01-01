# frozen_string_literal: true

module Api
  module V1
    class ExpensesController < ApiController
      before_action :load_expense, only: %i[show edit update destroy]
      before_action :load_expense_categories, only: %i[new create edit update]

      # GET /expenses
      def index
        @expenses = Expense.all
      end

      # GET /expenses/1
      def show; end

      # GET /expenses/new
      def new
        @expense = Expense.new
      end

      # GET /expenses/1/edit
      def edit; end

      # POST /expenses
      def create
        @expense = Expense.new(expense_params)
        respond_with @expense
      end

      # PATCH/PUT /expenses/1
      def update
        respond_with @expense
      end

      # DELETE /expenses/1
      def destroy
        @expense.destroy
        respond_with @expense
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
