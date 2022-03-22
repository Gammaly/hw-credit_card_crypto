# frozen_string_literal: true

require_relative '../credit_card'
require 'minitest/autorun'

# Feel free to replace the contents of cards with data from your own yaml file
card_details = [
  { num: '4916603231464963',
    exp: 'Mar-30-2020',
    name: 'Soumya Ray',
    net: 'Visa' },
  { num: '6011580789725897',
    exp: 'Sep-30-2020',
    name: 'Nick Danks',
    net: 'Visa' },
  { num: '5423661657234057',
    exp: 'Feb-30-2020',
    name: 'Lee Chen',
    net: 'Mastercard' }
]

cards = card_details.map do |c|
  CreditCard.new(c[:num], c[:exp], c[:name], c[:net])
end

describe 'Test hashing requirements' do
  describe 'Test regular hashing' do
    describe 'Check hashes are consistently produced' do
      # TODO: Check that each card produces the same hash if hashed repeatedly
      it 'should produce the same hash for a card' do
        cards_hash1 = cards.map(&:hash)
        cards_hash2 = cards.map(&:hash)

        _(cards_hash1.first).wont_be_nil
        _(cards_hash1).must_equal cards_hash2
      end
    end

    describe 'Check for unique hashes' do
      # TODO: Check that each card produces a different hash than other cards
      it 'should produce different hashes for different cards' do
        cards_hash = cards.map(&:hash)
        _(cards_hash.uniq.length).must_equal cards_hash.length
      end
    end
  end

  describe 'Test cryptographic hashing' do
    describe 'Check hashes are consistently produced' do
      # TODO: Check that each card produces the same hash if hashed repeatedly
      it 'should produce the same hash for a card' do
        cards_hash1 = cards.map(&:hash_secure)
        cards_hash2 = cards.map(&:hash_secure)

        _(cards_hash1.first).wont_be_nil
        _(cards_hash1).must_equal cards_hash2
      end
    end

    describe 'Check for unique hashes' do
      # TODO: Check that each card produces a different hash than other cards
      it 'should produce different hashes for different cards' do
        cards_hash = cards.map(&:hash_secure)
        _(cards_hash.uniq.length).must_equal cards_hash.length
      end
    end

    describe 'Check regular hash not same as cryptographic hash' do
      # TODO: Check that each card's hash is different from its hash_secure
      it 'should produce different hashes by different methods' do
        cards_hash_secure = cards.map(&:hash_secure)
        cards_hash = cards.map(&:hash)

        _(cards_hash_secure.first).wont_be_nil
        _(cards_hash_secure).wont_equal cards_hash
      end
    end
  end
end
