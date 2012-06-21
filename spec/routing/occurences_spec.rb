# encoding: UTF-8
require 'spec_helper'

describe OccurrencesController do
	context "Show Occurrence" do 
		it "show one occurence" do
			{ :get => "/events/1/tracks/2/occurrences/3/" }.
				should route_to(
					:controller => "occurrences",
					:action => "show",
					:event_id => "1",
					:track_id => "2",
					:id => "3"
				)
		end
	end
end