# == Schema Information
#
# Table name: names
#
#  id         :integer          not null, primary key
#  type       :string
#  name       :string
#  measure_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Name < ActiveRecord::Base
  belongs_to :measure
end
