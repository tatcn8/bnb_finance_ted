class ExpectedExpensesController < ApplicationController
    def create
        @future_month = FutureMonth.find(params[:future_month_id])
        @expected_expense = @future_month.expected_expenses.create(expected_expense_params)
        redirect_to future_month_path(@future_month)
      end
    
      def destroy
        @future_month = FutureMonth.find(params[:future_month_id])
        @expected_expense = @future_month.expected_expenses.find(params[:id])
        @expected_expense.destroy
        redirect_to future_month_path(@future_month), status: 303
      end
    
      private
        def expected_expense_params
          params.require(:expected_expense).permit(:title, :amount, :status)
        end
    end
