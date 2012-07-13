# == Schema Information
#
# Table name: fetch_gis
#
#  id         :integer         not null, primary key
#  gi         :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class FetchGi < ActiveRecord::Base
  attr_accessible :gi
end
