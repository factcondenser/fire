# frozen_string_literal: true

class ExpensesController < ApplicationController
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
    flash[:notice] = 'Expense was successfully created.' if @expense.save
    respond_with @expense
  end

  # PATCH/PUT /expenses/1
  # PATCH/PUT /expenses/1.json
  def update
    flash[:notice] = 'Expense was successfully updated.' if @expense.update(expense_params)
    respond_with @expense
  end

  # DELETE /expenses/1
  # DELETE /expenses/1.json
  def destroy
    @expense.destroy
    flash[:notice] = 'Expense was successfully destroyed.'
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
