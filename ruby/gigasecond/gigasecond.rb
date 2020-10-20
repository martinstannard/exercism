class Gigasecond
  def self.from(time)
    seconds = time.to_i
    age = seconds + 10**9
    Time.at(age)
  end
end
