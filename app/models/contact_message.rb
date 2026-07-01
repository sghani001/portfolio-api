class ContactMessage < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2, maximum: 100 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :message, presence: true, length: { minimum: 10, maximum: 5000 }

  # Honeypot field — bots fill this invisible field, humans don't
  attr_accessor :website
  validate :check_honeypot

  before_validation :set_email_domain, if: :email_changed?

  scope :pending, -> { where(sent_at: nil) }
  scope :recent, -> { order(created_at: :desc).limit(20) }

  private

  def set_email_domain
    self.email_domain = email.split('@').last if email.present?
  end

  def check_honeypot
    errors.add(:base, "Submission rejected") if website.present?
  end
end