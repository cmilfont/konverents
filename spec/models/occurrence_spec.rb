# encoding: UTF-8
require 'spec_helper'

describe Occurrence do

  describe "relationships" do
    it { should belong_to :track }
  end
  
end