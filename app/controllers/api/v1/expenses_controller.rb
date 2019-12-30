# frozen_string_literal: true

class Api
  module V1
    class ExpensesController < ApiController
      before_action :load_expense, only: %i[show edit update destroy]
      before_action :load_expense_categories, only: %i[new create edit update]

      # GET /expenses
      # GET /expenses.json
      def index
        @expenses = Expense.all
      end

      # GET /expenses/1
      # GET /expenses/1.json
      def show; end

      # GET /expenses/new
      def new
        @expense = Expense.new
      end

      # GET /expenses/1/edit
      def edit; end

      # POST /expenses
      # POST /expenses.json
      def create
        @expense = Expense.new(expense_params)

        respond_to do |format|
          if @expense.save
            format.json { render :show, status: :created, location: @expense }
          else
            format.json { render json: @expense.errors, status: :unprocessable_entity }
          end
        end
      end

      # PATCH/PUT /expenses/1
      # PATCH/PUT /expenses/1.json
      def update
        respond_to do |format|
          if @expense.update(expense_params)
            format.json { render :show, status: :ok, location: @expense }
          else
            format.json { render json: @expense.errors, status: :unprocessable_entity }
          end
        end
      end

      # DELETE /expenses/1
      # DELETE /expenses/1.json
      def destroy
        @expense.destroy
        respond_to do |format|
          format.html { redirect_to expenses_url, notice: 'Expense was successfully destroyed.' }
          format.json { head :no_content }
        end
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
