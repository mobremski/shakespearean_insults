require 'spec_helper'

describe "create a random id number and find a random record" do
  let (:count) {23}

  describe "count" do
    it "will return an integer" do
      expect(Insult.count).to be_a(Fixnum)
    end

    it "will return the number of insults" do
      expect(Insult.count).to eq(count)
    end
  end

  describe "random_insult_id" do
    it "will return a number between 1 and the total number of insults" do
      expect(Insult.random_insult_id).to be_between(1, count)
    end
  end

  describe "find" do
    it "will return an instance of the Insult class" do
      expect(Insult.find(13)).to be_a(Insult)
    end

    it "will return the insult with matching id" do
      insult = Insult.find(13)
      expect(insult.insult).to include("Away! Thou'rt poison to my blood.")
    end
  end
end
