class ExpectedIncomesController < ApplicationController
    def create
        @future_month = FutureMonth.find(params[:future_month_id])
        @expected_income = @future_month.expected_incomes.create(expected_income_params)
        redirect_to future_month_path(@future_month)
      end
    
      def destroy
        @future_month = FutureMonth.find(params[:future_month_id])
        @expected_income = @future_month.expected_incomes.find(params[:id])
        @expected_income.destroy
        redirect_to future_month_path(@future_month), status: 303
      end
    
      private
        def expected_income_params
          params.require(:expected_income).permit(:title, :amount, :earner, :status)
        end
    end

