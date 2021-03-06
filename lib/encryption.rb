require_relative 'reuseables'

class Encryption
  include Reuseables
  attr_reader :message

  def initialize(message, key, date = todays_date)
    @message = message
    @key = key
    @date = date
    @offset = offset
    @result = ''
  end

  def find_encrpytion_keys(key = @key, offset = @offset)
    key_acc = []
    key.each_value { |v| key_acc << v.to_i }
    offset_acc = []
    offset.each_value { |v| offset_acc << v.to_i }
    keys = key_acc.zip(offset_acc).map { |x, y| x + y }
    keys
  end

  def encrpytion_keys(numbers = find_encrpytion_keys)
    keys = Hash.new
    keys[:A] = numbers[0]
    keys[:B] = numbers[1]
    keys[:C] = numbers[2]
    keys[:D] = numbers[3]
    keys
  end

  def encrypt_message(message, amount_of_shift)
    encrypted_message = ''
    format_message(message).each_char.with_index do |char, index|
      if alphabet.include?(char)
        encrypted_message += shift_alphabet_letter(index, amount_of_shift)[alphabet.index(char)]
      else
        encrypted_message += char
      end
    end
    @result = encrypted_message
  end

  def final_encryption
    { encryption: @result,
      key: @key,
      date: @date
    }
  end
end
