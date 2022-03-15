# frozen_string_literal: true

# Validates Double Transposition Cipher Algorithm
module DoubleTranspositionCipher
  def self.encrypt(document, key)
    # TODO: FILL THIS IN!
    ## Suggested steps for double transposition cipher
    # 1. find number of rows/cols such that matrix is almost square
    width = Math.sqrt(document.to_s.size).ceil

    # 2. break plaintext into evenly sized blocks
    doc = document.to_s << '$' * (width * width - document.to_s.size)
    blocks = doc.to_s.chars.each_slice(width).to_a

    # 3. sort rows in predictibly random way using key as seed
    rows_key = (0..width - 1).to_a.shuffle(random: Random.new(key))
    cipher_rows = blocks.each_with_index.map { |_row, index| blocks[rows_key[index]] }

    # 4. sort columns of each row in predictibly random way
    cols_key = (0..width - 1).to_a.shuffle(random: Random.new(key + 1))
    rows_t = cipher_rows.transpose
    cipher_cols = rows_t.each_with_index.map { |_row, index| rows_t[cols_key[index]] }.transpose

    # 5. return joined cyphertext
    cipher_cols.join
  end

  def self.decrypt(ciphertext, key)
    # TODO: FILL THIS IN!
    width = Math.sqrt(ciphertext.to_s.size).ceil
    blocks = ciphertext.chars.each_slice(width).to_a

    cols_key = (0..width - 1).to_a.shuffle(random: Random.new(key + 1))

    blocks_t = blocks.transpose
    cipher_cols = blocks_t.each_with_index.map { |_row, index| blocks_t[cols_key.index(index)] }.transpose

    rows_key = (0..width - 1).to_a.shuffle(random: Random.new(key))
    cipher_rows = cipher_cols.each_with_index.map { |_row, index| cipher_cols[rows_key.index(index)] }

    plaintext = cipher_rows.join
    plaintext.tr('$', '')
  end
end
