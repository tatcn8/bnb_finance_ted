module Visible
    extend ActiveSupport::Concern
  
    VALID_STATUSES = ['Expected', 'Realized', 'public']
  
    included do
      validates :status, inclusion: { in: VALID_STATUSES }
    end
  end