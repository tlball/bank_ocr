# frozen_string_literal: true

describe BankOCR::Entry do
  let(:entry_rows) do
    [
      '    _  _     _  _  _  _  _ ',
      '  | _| _||_||_ |_   ||_||_|',
      '  ||_  _|  | _||_|  ||_| _|'
    ]
  end

  it 'takes in rows for an entry' do
    entry = described_class.new(entry_rows)

    expect(entry).to be_a(BankOCR::Entry)
    expect(entry.entry_rows).to eq(entry_rows)
  end

  it 'raises an error if no entry_rows is provided' do
    entry_rows = nil

    expect { described_class.new(entry_rows) }
      .to raise_error(BankOCR::ArgumentError, 'entry_rows must be an Array')
  end

  it 'raises an error if entry_rows is not an Array' do
    entry_rows = 'character matrix'

    expect { described_class.new(entry_rows) }
      .to raise_error(BankOCR::ArgumentError, 'entry_rows must be an Array')
  end

  described 'to_i' do
    it 'validates the number of rows'
    it 'validates the last row is blank'
    it 'parses the rows into 9 InputCharacters'
  end

  describe 'valid?' do
    it 'consists of 9 input characters'
    it 'has an empty last line'
  end
end
