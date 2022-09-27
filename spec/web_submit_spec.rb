require "web_submit"

RSpec.describe WebSubmit do
  let(:params) do
    {
      current_attempt: current_attempt,
      code1: "RED",
      code2: "GREEN",
      code3: "BLUE",
      code4: "YELLOW",
      guess1: guess1,
      guess2: guess2,
      guess3: guess3,
      guess4: guess4,
    }
  end
  describe "#view" do
    context "first guess, 4/4 match" do
      let(:current_attempt) { 1 }
      let(:guess1) { "RED" }
      let(:guess2) { "GREEN" }
      let(:guess3) { "BLUE" }
      let(:guess4) { "YELLOW" }

      it "returns correct view values" do
        subject = described_class.new(params)
        view = subject.view

        expect(view.chances).to eq 4
        expect(view.not_lost).to eq true
        expect(view.current_attempt).to eq 1
        expect(view.next_attempt).to eq 2
        expect(view.error_message).to eq nil
        expect(view.message).to eq "Congratulations!"
      end
    end

    context "first guess, 3/4 match" do
      let(:current_attempt) { 1 }
      let(:guess1) { "RED" }
      let(:guess2) { "GREEN" }
      let(:guess3) { "BLUE" }
      let(:guess4) { "BLUE" }

      it "returns correct view values" do
        subject = described_class.new(params)
        view = subject.view

        expect(view.chances).to eq 4
        expect(view.not_lost).to eq true
        expect(view.current_attempt).to eq 1
        expect(view.next_attempt).to eq 2
        expect(view.error_message).to eq nil
        expect(view.message).to eq "Four colors guessed, three at the exact position and one at the wrong position"
      end
    end
  end
end
