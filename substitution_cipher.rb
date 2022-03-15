# frozen_string_literal: true

# Validates Substitution Cipher
module SubstitutionCipher
  # Caesar Algorithm
  module Caesar
    # Encrypts document using key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.encrypt(document, key)
      # TODO: encrypt string using caesar cipher
      document.to_s.chars.map { |char| (char.ord + key).chr }.join
    end

    # Decrypts String document using integer key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.decrypt(document, key)
      # TODO: decrypt string using caesar cipher
      document.to_s.chars.map { |char| (char.ord - key).chr }.join
    end
  end

  # Permutation Algorithm
  module Permutation
    # Encrypts document using key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.encrypt(document, key)
      # TODO: encrypt string using a permutation cipher
      dict = (0..127).to_a.shuffle(random: Random.new(key))
      document.to_s.chars.map { |char| dict[char.ord].chr }.join
    end

    # Decrypts String document using integer key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.decrypt(document, key)
      # TODO: decrypt string using a permutation cipher
      dict = (0..127).to_a.shuffle(random: Random.new(key))
      document.to_s.chars.map { |char| dict.index(char.ord).chr }.join
    end
  end
end
