RSpec::Matchers.define(:to_s_with) do |method_name|
  match do |subject|
    subject.stub(method_name).and_return('stubbed_to_s_method')
    @to_s_with_string = subject.to_s

    subject.stub(method_name).and_return(nil)
    @to_s_with_nil = subject.to_s

    @to_s_with_string == 'stubbed_to_s_method' && @to_s_with_nil == ''
  end

  description do
    "use #{method_name.inspect} when #to_s is called"
  end

  failure_message_for_should do |actual|
    "expected #{subject.inspect} to return an empty string when #{method_name} is nil and return #{method_name} when present"
  end
end


module RSpec
  module Mocks
    class Mock
      def inspect
#        "#{@name} "
#        debugger
        "#<#{self.class}:#{sprintf '0x%x', self.object_id} @name=#{@name.inspect} #{ self.email } >"
        
      end
    end
  end
end