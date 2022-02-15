# used ruby 2.7.0

require "rspec/autorun"

class SortedArray < Array

  # Assumed that the array is already sorted.
  def contains?(number)
    return false unless number.is_a? Numeric
    !!(self & [number]).first
  end

  # Assumed that the array is already sorted.
  def randomize
    sort_by { rand }
  end

  def remove_duplicates
    hash_value.keys
  end

  private
  # Memoized hash_value so we dont repeat initialization of the hash
  # This would not be updated whenever we add or remove elements on the array
  def hash_value
    @hash_value ||= Hash[(self).zip(0...self.size)]
  end
end

# Regex for dates
REGEX_FOR_DATES = /^([1-9]|0[1-9]|1[0-2])\/([1-9]|0[1-9]|1[0-9]|2[0-9]|3[0-1])\/(\d{4})$/

describe SortedArray do
  let(:sa) { described_class.new(collection) }

  describe ".contains?" do
    let(:collection) { [22, 23, 77, 88, 6] }
    subject { sa.contains?(number) } 
    
    context "supplied number is present in the collection" do
      let(:number) { 6 }
      it { is_expected.to be true }
    end

    context "supplied number is not numeric" do
      let(:number) { :d }
      it { is_expected.to be false }
    end

    context "supplied number is not present in the collection" do
      let(:number) { 99 }
      it {is_expected.to be false}
    end
  end

  describe ".randomize" do
    let(:collection) { [1,2,3,4,5,6,7,8,9] }
    subject { sa.randomize } 
    
    context "when the collection is sorted" do
      it { is_expected.not_to eq(collection) }
      it "should be in same size" do
        expect(subject.size).to eq(collection.size)
      end
    end
  end

  describe ".remove_duplicates" do
    let(:collection) { %w[apple banana apple mango banana] }
    subject { sa.remove_duplicates } 
    
    context "when the collection is sorted and have duplicates" do
      let(:expected_collection) { %w[apple banana mango] }
      it "is expected to remove duplicates and still have same order" do 
        is_expected.to eq(expected_collection)
      end
    end

    context "when the collection has no duplicates" do
      let(:collection) { %w[apple banana mango] }
      it {is_expected.to match(collection)}
    end
  end
end

describe "REGEX_FOR_DATES" do 

  subject { !!(data_string.match?(REGEX_FOR_DATES)) }

  context "valid date strings" do 
    context "mm/dd/yyyy" do
      let(:data_string) { '12/31/2022' }
      it {is_expected.to be(true) }
    end
    context "m/d/yyyy" do
      let(:data_string) { '7/1/2022' }
      it {is_expected.to be(true) }
    end
    context "mm/d/yyyy" do
      let(:data_string) { '03/1/2022' }
      it {is_expected.to be(true) }
    end
    context "m/dd/yyyy" do
      let(:data_string) { '1/09/2022' }
      it {is_expected.to be(true) }
    end
  end

  context "invalid date strings" do 
    context "mm/dd/yyyy" do
      let(:data_string) { '12/31/20242' }
      it {is_expected.to be(false) }
    end
    context "m/d/yyyy" do
      let(:data_string) { '0/0/2022' }
      it {is_expected.to be(false) }
    end
    context "mm/d/yyyy" do
      let(:data_string) { '13/1/2022' }
      it {is_expected.to be(false) }
    end
    context "m/dd/yyyy" do
      let(:data_string) { '1/46/2022' }
      it {is_expected.to be(false) }
    end
  end
end