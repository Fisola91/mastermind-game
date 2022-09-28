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
    context "first attempt, 4/4 match" do
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

    context "first attempt, 3/4 match" do
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

    context "first attempt, wrong input" do
      let(:current_attempt) { 1 }
      let(:guess1) { "R" }
      let(:guess2) { "G" }
      let(:guess3) { "B" }
      let(:guess4) { "Y" }

      it "returns invalid input" do
        subject = described_class.new(params)
        view = subject.view

        expect(view.chances).to eq 4
        expect(view.not_lost).to eq true
        expect(view.current_attempt).to eq 1
        expect(view.next_attempt).to eq 1
        expect(view.error_message).to eq "Invalid input, try again!"
        expect(view.message).to eq nil
      end
    end

    context "second attempt, wrong position" do
      let(:current_attempt) { 2 }
      let(:guess1) { "BLUE" }
      let(:guess2) { "RED" }
      let(:guess3) { "YELLOW" }
      let(:guess4) { "RED" }

      it "returns four :partial values" do
        subject = described_class.new(params)
        view = subject.view

        expect(view.chances).to eq 4
        expect(view.not_lost).to eq true
        expect(view.current_attempt).to eq 2
        expect(view.next_attempt).to eq 3
        expect(view.error_message).to eq nil
        expect(view.message).to eq "Four colors guessed at the wrong position"
      end
    end

    context "third attempt, 2/4 match" do
      let(:current_attempt) { 3 }
      let(:guess1) { "RED" }
      let(:guess2) { "GREEN" }
      let(:guess3) { "YELLOW" }
      let(:guess4) { "BLUE" }

      it "returns four :partial values" do
        subject = described_class.new(params)
        view = subject.view

        expect(view.chances).to eq 4
        expect(view.not_lost).to eq true
        expect(view.current_attempt).to eq 3
        expect(view.next_attempt).to eq 4
        expect(view.error_message).to eq nil
        expect(view.message).to eq  "Four colors guessed, two at the exact position and two at the wrong position"
      end
    end

    describe "looses all guess chances" do
      context "when nil" do
        let(:current_attempt) { 5 }
        let(:guess1) { nil }
        let(:guess2) { nil }
        let(:guess3) { nil }
        let(:guess4) { nil }

        it "looses all the chances" do
          subject = described_class.new(params)
          view = subject.view

          expect(view.not_lost).to eq false
          expect(view.message).to eq "You lost, ran out of turns."
        end
      end

      context "when empty string" do
        let(:current_attempt) { 5 }
        let(:guess1) { "" }
        let(:guess2) { "" }
        let(:guess3) { "" }
        let(:guess4) { "" }

        it "looses all the chances" do
          subject = described_class.new(params)
          view = subject.view

          expect(view.not_lost).to eq false
          expect(view.message).to eq "You lost, ran out of turns."
        end
      end
    end

  end
end
