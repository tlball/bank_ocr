# frozen_string_literal: true

describe BankOCR::CharacterMapping do
  describe 'value' do
    it 'returns the corresponding integer for the character_matrix' do
      expected_mappings = {
        described_class::ONE   => 1,
        described_class::TWO   => 2,
        described_class::THREE => 3,
        described_class::FOUR  => 4,
        described_class::FIVE  => 5,
        described_class::SIX   => 6,
        described_class::SEVEN => 7,
        described_class::EIGHT => 8,
        described_class::NINE  => 9
      }

      expected_mappings.each do |character_matrix, character_value|
        expect(described_class.value(character_matrix)).to eq(character_value)
      end
    end

    it 'returns nil if no value is found' do
      character_matrix = [
        ['_', '_', '_'],
        ['_', '_', '_'],
        ['_', '_', '_']
      ]

      expect(described_class.value(character_matrix)).to be nil
    end
  end
end
