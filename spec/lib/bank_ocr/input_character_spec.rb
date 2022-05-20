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
      .to raise_error(BankOCR::InputCharacter::ArgumentError, 'character_matrix must be an Array')
  end

  it 'raises an error if character_matrix is not an Array' do
    character_matrix = 'character matrix'

    expect { described_class.new(character_matrix) }
      .to raise_error(BankOCR::InputCharacter::ArgumentError, 'character_matrix must be an Array')
  end

  describe 'valid?' do
    context 'character matrix width' do
      it 'returns true if the width for all rows is 3' do
        character_matrix = [
          [' ', '_', ' '],
          ['|', '_', '|'],
          [' ', '_', '|']
        ]

        input_character = described_class.new(character_matrix)
        expect(input_character.valid?).to be true
      end

      it 'returns false if the width of at least 1 row is not 3' do
        character_matrix = [
          [' ', '_', ' '],
          ['|', '_'],
          [' ', '_', '|']
        ]

        input_character = described_class.new(character_matrix)
        expect(input_character.valid?).to be false
      end
    end

    context 'character matrix height' do
      it 'returns true if the height for all rows is 3' do
        character_matrix = [
          [' ', '_', ' '],
          ['|', '_', '|'],
          [' ', '_', '|']
        ]

        input_character = described_class.new(character_matrix)
        expect(input_character.valid?).to be true
      end

      it 'returns false if the height of at least 1 row is not 3' do
        character_matrix = [
          [' ', '_', ' '],
          ['|', '_', '|']
        ]

        input_character = described_class.new(character_matrix)
        expect(input_character.valid?).to be false
      end
    end

    context 'character matrix content' do
      it 'returns true if consists of pipes, underscores, and spaces' do
        character_matrix = [
          [' ', '_', ' '],
          ['|', '_', '|'],
          [' ', '_', '|']
        ]

        input_character = described_class.new(character_matrix)
        expect(input_character.valid?).to be true
      end

      it 'returns false if character_matrix has an unexpected character' do
        character_matrix = [
          [' ', '_', ' '],
          ['x', '_', '|'],
          [' ', 'y', 'z']
        ]

        input_character = described_class.new(character_matrix)
        expect(input_character.valid?).to be false
      end
    end
  end
end
