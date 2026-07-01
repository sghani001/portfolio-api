class ContactMessage < ApplicationRecord
  # Model for storing contact form submissions

  # Stores the name of the person contacting (from form)
  validates :name, presence: true, length: { minimum: 2, maximum: 100 }

  # Stores the email address and validates format
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  # Stores the actual message content and validates it's not empty
  validates :message, presence: true, length: { minimum: 10, maximum: 5000 }

  # Shelter from bot submissions - check if name field is filled (honeypot technique)
  validate :check_honeypot

  # Callbacks
  before_validation :set_email_domain, if: :email_changed?

  # Email status tracking
  scope :pending, -> { where(sent_at: nil) }
  scope :recent, -> { order(created_at: :desc).limit(20) }

  private

  # Private method to track email domain for filtering/spam detection
  def set_email_domain
    self.email_domain = email.split('@').last if email.present?
  end

  # Private method to check honeypot field for bot protection
  def check_honeypot
    return if name.blank?
    errors.add(:base, "Form submission rejected - please leave name field empty")
  end
end