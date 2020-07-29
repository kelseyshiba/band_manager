class Invoice < ApplicationRecord

    # t.datetime "date"
    # t.float "amount"
    # t.text "description"
    # t.integer "user_id"
    # t.datetime "created_at", precision: 6, null: false
    # t.datetime "updated_at", precision: 6, null: false
    # t.integer "gig_id"
    belongs_to :user
    belongs_to :gig

    validates :date, presence: true

    def self.order_by_date
        order(date: :asc)
    end

    def formatted_date
        self.date.strftime("%B %d, %Y, %I:%M%P")
    end
end
