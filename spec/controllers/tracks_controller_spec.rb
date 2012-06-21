require 'spec_helper'
describe TracksController do
  before do
		@track = mock('Track')
	end

	context "list one or all track" do
		it "index" do
			Track.stub(:find).and_return(@track).should be
		end

		it "show" do
			Track.stub(:find).and_return(@track).should be
		end
  end

	context "create track" do
		it "new track" do
			Track.stub(:new).and_return(@track).should be
		end

		it "create track" do
			Track.stub(:create).and_return(@track).should be
		end
	end

	context "update track" do
		it "edit track" do
			Track.stub(:find).and_return(@track).should be
		end

		it "update track" do
			Track.stub(:update_attributes).and_return(@track).should be
		end
	end

	context "delete track" do
		it "destoy one track" do
    	@track.stub(:destroy).and_return().should be
		end
	end
end
