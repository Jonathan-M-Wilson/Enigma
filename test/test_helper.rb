require 'simplecov'            # These two lines must go first
SimpleCov.start

require 'minitest/autorun'     # Sets up minitest
require 'minitest/pride'
require 'mocha/minitest'
require "./lib/enigma"
require "./lib/key"
require "./lib/offset"
require "./lib/encryption"
require "./lib/decryption"
require 'date'
