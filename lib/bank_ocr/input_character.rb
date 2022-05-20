# frozen_string_literal: true

module BankOCR
  # This class represents characters read in from the input file and ensures they
  # are valid
  class InputCharacter
    CHAR_WIDTH  = 3
    CHAR_HEIGHT = 3
    VALID_CHARS = [' ', '_', '|'].freeze

    attr_reader :character_matrix

    def initialize(character_matrix)
      raise ArgumentError, 'character_matrix must be an Array' unless character_matrix.is_a?(Array)

      @character_matrix = character_matrix
    end

    def valid?
      return false if character_matrix.size != CHAR_HEIGHT
      return false if character_matrix.any? { |row| row.size != CHAR_WIDTH }

      (character_matrix.flatten - VALID_CHARS).empty?
    end

    def to_i
      CharacterMapping.value(character_matrix)
    end

    class ArgumentError < ::ArgumentError; end
  end
end
