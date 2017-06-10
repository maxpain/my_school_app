class Order < ApplicationRecord
  has_many :line_items
  belongs_to :pupil
  belongs_to :teacher
  belongs_to :customer, class_name: 'Pupil'

  before_create :set_status

  enum status: [:cart, :paid]

  def paid!
    if customer.account > total_price
      update(status: :paid)
      customer.update(account: customer.account - total_price)
    else
      errors.add(:base, 'Недостаточно денег на счете, пополните пожалуйста баланс или не ешьте')
      return false
    end
  end

  def total_price
    result = 0
    line_items.each do |line_item|
      result += line_item.total_price
    end
    update(total_price: result)
    result
  end

  def send_verification
    code = generate_verification_code
    message = MainsmsApi::Message.new(
                message: "Код подтверждения: #{code}",
                recipients: [customer.phone]
              )
    response = message.deliver
    if response.status == 'success'
      update(verification_sent_at: Time.now, verification_code: code)
    end
  end

  def verificated?
    verificated_at.present?
  end

  def verify!(code)
    code == verification_code && update(verificated_at: Time.now)
  end

  private

  def generate_verification_code
    begin
      code = Random.rand(1000..9999)
    end while Order.where(verificated_at: nil).exists?(verification_code: code)
    code
  end

  def set_status
    self.status = :cart
  end

end
