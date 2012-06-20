# encoding: UTF-8
require 'spec_helper'
describe OccurrencesController do

  before do 
  	@occurrence = mock('Occurrence')
  end

  context "Show Occurrence" do 
	  it "show all occurrences" do 
	  	Occurrence.stub(:find).and_return(@occurrence).should be
	  end

	  it "show one occurrence" do 
	  	Occurrence.stub(:find).and_return(@occurrence).should be
	  end

  end

end