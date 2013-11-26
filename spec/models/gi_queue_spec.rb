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

require 'spec_helper'

describe GiQueue do
  pending "add some examples to (or delete) #{__FILE__}"
end
