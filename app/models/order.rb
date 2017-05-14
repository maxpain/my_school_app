class Order < ApplicationRecord
  has_many :line_items
  belongs_to :pupil
  belongs_to :teacher

  before_create :set_status

  enum status: [:cart, :paid]

  def paid!
    update(status: :paid)
  end

  def total_price
    result = 0
    line_items.each do |line_item|
      result += line_item.total_price
    end
    update(total_price: result)
    result
  end

  private

    def set_status
      self.status = :cart
    end

end
