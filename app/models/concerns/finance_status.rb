module FinanceStatus
    extend ActiveSupport::Concern
  
    VALID_STATUSES = ['Expected', 'Realized']
  
    included do
      validates :status, inclusion: { in: VALID_STATUSES }
    end
  end