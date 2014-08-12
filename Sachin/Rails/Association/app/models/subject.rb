class Subject < ActiveRecord::Base
  belongs_to :Student
  belongs_to :Document
end
