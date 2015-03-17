require 'rails_helper'
require 'factory_girl_rails'
RSpec.describe Setting, :type => :model do
  
  before(:all) do
    @str = "Foo bar"
    @integer = 5
    @float = 6.95
  end

  describe 'model validations' do
    context 'String value' do
      it "can work with String value" do
        Setting.foo = @str
        expect(Setting.foo).to eq @str
      end
    end

    context 'Boolean value' do
      it "can work with Boolean value" do
        Setting.boolean_true = true
        Setting.boolean_false = false
        expect(Setting.boolean_true).to eq true
        expect(Setting.boolean_false).to eq false
     end
    end 

    context 'Integer value' do
      it "can work with float value" do
        Setting.integer_value = @integer
        expect(Setting.integer_value).to eq @integer
      end
    end

    context 'Float value' do
      it "can work with float value" do
        Setting.float_value = @float
        expect(Setting.float_value).to eq @float
      end
    end

    context 'Unique key' do
      it "can change value with key" do
      	expect(Setting.float_value).to eq @float
        Setting.float_value = @integer
        expect(Setting.float_value).to eq @integer
      end
    end

    it "should require a both key and value" do
      expect(FactoryGirl.build(:setting, :var => "", :value => "").id).to be_nil
      expect(FactoryGirl.build(:setting, :var => "email_notification", :value => 'example@abc.com')).to be_valid
    end
  end
end