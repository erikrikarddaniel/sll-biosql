# == Schema Information
#
# Table name: fetch_gis
#
#  id         :integer         not null, primary key
#  gi         :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

require 'spec_helper'

describe FetchGi do
  before do
    @fetch_gi = FetchGi.new(gi: 379064075)
  end

  subject { @fetch_gi }

  it { should respond_to(:gi) }
end
