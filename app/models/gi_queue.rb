# == Schema Information
#
# Table name: gi_queues
#
#  id         :integer         not null, primary key
#  gi         :string(255)     not null
#  fetched    :boolean         default(FALSE)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class GiQueue < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :gi, :fetched

end
