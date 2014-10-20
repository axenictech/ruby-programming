class Normal < ActiveRecord::Base
  belongs_to :batch
  validates :ns_code, presence: true,numericality: true,uniqueness: true,length: { minimum: 3 ,maximum:3}
  validates :ns_subject, presence: true, format: { with: /\A[a-zA-Z]+\z/,message: "only allows letters" }
end
