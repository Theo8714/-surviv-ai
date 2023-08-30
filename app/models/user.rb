class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :invoices
  has_many :relationships
  # validates :company_name, :phone_number, :first_name, :last_name, presence: true
  # validates :company_name, uniqueness: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
