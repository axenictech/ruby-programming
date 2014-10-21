class Elective < ActiveRecord::Base
	belongs_to :batch
  validates :es_group,presence: true,format: { with: /\A[a-zA-Z]+\z/,message: "only allows letters" }
  validates :es_subject, presence: true,uniqueness: true, format: { with: /\A[a-zA-Z]+\z/,message: "only allows letters" }
  
end
