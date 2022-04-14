module FinanceStatus
    extend ActiveSupport::Concern
  
    VALID_STATUSES = ['Expected', 'Realized']
  
    included do
      validates :status, inclusion: { in: VALID_STATUSES }
      scope :expected, -> { where(status: "Expected") }
      scope :realized, -> { where(status: "Realized") }
    end
  end