require "spec_helper"

RSpec.describe Arx::Result do
  describe "#switch" do
    subject do
      result.switch do
        on :foo do
          1
        end

        on :bar do |value|
          value
        end

        on :baz do |value_1, value_2|
          "#{value_1}-#{value_2}"
        end
      end
    end

    context "when the first type matches" do
      let(:result) { described_class.new(:foo) }

      it { is_expected.to eq(1) }
    end

    context "when the second type matches" do
      let(:result) { described_class.new(:bar, 2) }

      it { is_expected.to eq(2) }
    end

    context "when the third type matches" do
      let(:result) { described_class.new(:baz, 3, 4) }

      it { is_expected.to eq("3-4") }
    end

    context "when none of the types match" do
      let(:result) { described_class.new(:blah, 5) }

      specify do
        expect { subject }.
          to raise_error(Arx::SwitchError, "Unexpected result type - :blah. Data: [5]")
      end
    end
  end
end
