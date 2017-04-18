class CatRentalRequest < ApplicationRecord
  validates :status, inclusion: { in: %w(APPROVED DENIED PENDING),
    message: "%{value} is not a valid status."}
  validate :does_not_overlap_approved_request

  belongs_to :cat

  def overlapping_requests
    CatRentalRequest.select("*")
      .where("end_date >= ? AND id != ? AND cat_id = ?", start_date, id, cat_id)
      .where("end_date <= ? OR start_date <= ?", end_date, end_date)
  end

  def overlapping_approved_requests
    overlapping_requests
      .select('*')
      .where(status: 'APPROVED')
  end

  def overlapping_pending_requests
    overlapping_requests
      .select('*')
      .where(status: 'PENDING')
  end

  def approve!
    pending = overlapping_pending_requests
    CatRentalRequest.transaction do
      pending.update(status: 'DENIED')
      self.status = 'APPROVED'
      self.save
    end
  end

  def deny!
    self.status = 'DENIED'
    self.save
  end


  private

  def does_not_overlap_approved_request
    if overlapping_approved_requests.exists?
      errors[:base] << 'Approved overlapping rentals exist'
    end
  end

end
