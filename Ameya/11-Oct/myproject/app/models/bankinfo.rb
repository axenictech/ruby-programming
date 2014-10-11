class Bankinfo < ActiveRecord::Base
  belongs_to :personalinfo
  	validates :bank_name, presence: true, length: { minimum: 5 }
end