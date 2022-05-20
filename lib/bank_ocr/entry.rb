# frozen_string_literal: true

module BankOCR
  # This class represents a group of input characters
  class Entry
    attr_reader :entry_rows

    def initialize(entry_rows)
      raise ArgumentError, 'entry_rows must be an Array' unless entry_rows.is_a?(Array)

      @entry_rows = entry_rows
    end

    def valid?
      false
    end
  end
end
