# encoding: UTF-8
require 'spec_helper'

describe Event do
  
  describe "Validations" do
    it { should validate_presence_of :title }
  end

  describe "relationships" do
    it { should have_many :tracks}
  end
  
end