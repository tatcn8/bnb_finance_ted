class Month < ApplicationRecord
    include Visible

    has_many :expenses, dependent: :destroy
    has_many :incomes, dependent: :destroy

    validates :title, presence: true, length: { minimum: 3 }

end
