# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  acts_as_messageable
  enum role: [:Proveedor, :Restaurant]
  after_initialize :set_default_role, :if => :new_record?


  def set_default_role
    self.role ||= :Proveedor
  end
  

  def mailboxer_email(object)
    nil
  end
  
  has_many :reviews
  has_many :cars
  has_and_belongs_to_many :asks

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: Devise.email_regexp }
end
