require_relative 'helper'

class TestCheersIntegration < MiniTest::Unit::TestCase
  def test_a_name_with_no_vowels
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts "BPT"
      pipe.close_write
      shell_output = pipe.read
    end
    expected_output = <<EOS
What's Your Name, Yo?
Give me a ... B
Give me a ... P
Give me a ... T
BPT's just Grand!
EOS
    assert_equal expected_output, shell_output
  end

  def test_a_name_with_vowels
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts "AEIOU"
      pipe.close_write
      shell_output = pipe.read
    end
    expected_output = <<EOS
What's Your Name, Yo?
Give me an ... A
Give me an ... E
Give me an ... I
Give me an ... O
Give me an ... u
EOS
  end

  def test_a_name_with_consonants_that_get_an_an
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts "FHLMNRS"
      pipe.close_write
      shell_output = pipe.read
    end
    expected_output = <<EOS
What's Your Name, Yo?
Give me an ... F
Give me an ... H
Give me an ... L
Give me an ... M
Give me an ... N
Give me an ... R
Give me an ... S
EOS
  end

  def test_a_name_with_mixed_consonants_and_vowels
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts "Drew"
      pipe.close_write
      shell_output = pipe.read
    end
    expected_output = <<EOS
What's Your Name, Yo?
Give me a ... D
Give me an ... R
Give me an ... E
Give me a  ... W
EOS
  end
end
