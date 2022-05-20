# frozen_string_literal: true

module BankOCR
  # This class represents a group of input characters
  class Entry
    attr_reader :entry_rows

    def initialize(entry_rows)
      raise ArgumentError, 'entry_rows must be an Array' unless entry_rows.is_a?(Array)

      @entry_rows = entry_rows
    end

    def to_i
      input_characters = parse_entry_rows

      # TODO: print out the `#.to_i` for each input_character
    end

    def valid?
      false
    end

    private

    def parse_entry_rows
      # TODO: read through each row to create 9 character matrices, and turn those
      # into an array of InputCharacters
    end
  end
end
