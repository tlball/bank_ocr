# frozen_string_literal: true

require 'bank_ocr/entry'
require 'bank_ocr/input_character'
require 'bank_ocr/character_mapping'

# Main class which will scan the bank document and
# output the corresponding account numbers
module BankOCR
  class ArgumentError < ::ArgumentError; end
end
