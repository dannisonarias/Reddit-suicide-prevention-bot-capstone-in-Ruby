require './lib/logic.rb'


RSpec.describe APPVariables do
    let(:array1) { w%["dog","cat","bird"] }
    describe 'APPvariables initialize ' do
        it 'Initializing an instance class of APPvariables' do
            test1 = APPVariables.new
          expect(test1.keyword_hash).to eql({})
        end
    

      end

end