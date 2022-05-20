# frozen_string_literal: true

module BankOCR
  # This class represents characters read in from the input file and ensures they
  # are valid
  class InputCharacter
    attr_reader :character_matrix

    def initialize(character_matrix)
      raise ArgumentError, 'character_matrix must be an Array' unless character_matrix.is_a?(Array)

      @character_matrix = character_matrix
    end

    def valid?
      false
    end

    class ArgumentError < ::ArgumentError; end
  end
end
