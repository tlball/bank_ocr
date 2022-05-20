# frozen_string_literal: true

describe BankOCR::InputCharacter do
  it 'takes in a character matrix on creation' do
    character_matrix = [
      [' ', '_', ' '],
      ['|', '_', '|'],
      [' ', '_', '|']
    ]

    input_character = described_class.new(character_matrix)

    expect(input_character).to be_a(BankOCR::InputCharacter)
    expect(input_character.character_matrix).to eq(character_matrix)
  end

  it 'raises an error if no character_matrix is provided' do
    character_matrix = nil

    expect { described_class.new(character_matrix) }
      .to raise_error(BankOCR::ArgumentError, 'character_matrix must be an Array')
  end

  it 'raises an error if character_matrix is not an Array' do
    character_matrix = 'character matrix'

    expect { described_class.new(character_matrix) }
      .to raise_error(BankOCR::ArgumentError, 'character_matrix must be an Array')
  end

  describe 'to_i' do
    it 'returns the corresponding value for the InputCharacter' do
      input_character = described_class.new(BankOCR::CharacterMapping::NINE)

      expect(input_character.to_i).to eq(9)
    end

    it 'returns nil if no value is found' do
      character_matrix = [
        ['_', '_', '_'],
        ['_', '_', '_'],
        ['_', '_', '_']
      ]

      input_character = described_class.new(character_matrix)

      expect(input_character.to_i).to be nil
    end
  end
end
