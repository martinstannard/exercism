=begin
Write your code for the 'Gigasecond' exercise in this file. Make the tests in
`gigasecond_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/gigasecond` directory.
=end

class Gigasecond

  def self.from(time)
    seconds = time.to_i
    age = seconds + 10 ** 9
    Time.at(age)
  end
end
