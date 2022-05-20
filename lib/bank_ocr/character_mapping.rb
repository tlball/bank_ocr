# frozen_string_literal: true

module BankOCR
  # This module maps character_matrices to integers
  module CharacterMapping
    ONE = [
      [' ', ' ', ' '],
      [' ', ' ', '|'],
      [' ', ' ', '|']
    ].freeze

    TWO = [
      [' ', '_', ' '],
      [' ', '_', '|'],
      ['|', '_', ' ']
    ].freeze

    THREE = [
      [' ', '_', ' '],
      [' ', '_', '|'],
      [' ', '_', '|']
    ].freeze

    FOUR = [
      [' ', ' ', ' '],
      ['|', '_', '|'],
      [' ', ' ', '|']
    ].freeze

    FIVE = [
      [' ', '_', ' '],
      ['|', '_', ' '],
      [' ', '_', '|']
    ].freeze

    SIX = [
      [' ', '_', ' '],
      ['|', '_', ' '],
      ['|', '_', '|']
    ].freeze

    SEVEN = [
      [' ', '_', ' '],
      [' ', ' ', '|'],
      [' ', ' ', '|']
    ].freeze

    EIGHT = [
      [' ', '_', ' '],
      ['|', '_', '|'],
      ['|', '_', '|']
    ].freeze

    NINE = [
      [' ', '_', ' '],
      ['|', '_', '|'],
      [' ', '_', '|']
    ].freeze

    KNOWN_CHARACTERS = [
      ONE,
      TWO,
      THREE,
      FOUR,
      FIVE,
      SIX,
      SEVEN,
      EIGHT,
      NINE
    ].freeze

    def value(character_matrix)
      char_index = KNOWN_CHARACTERS.index(character_matrix)
      return unless char_index

      char_index + 1
    end
    module_function :value
  end
end
