class Personalbankinfo < ActiveRecord::Base
  belongs_to :personalinfo
  validates :bank_name, presence: true, format: { with: /\A[a-zA-Z]+\z/,message: "only allows letters" }
end
