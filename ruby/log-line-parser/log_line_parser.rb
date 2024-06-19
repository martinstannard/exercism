class LogLineParser
  def initialize(line)
    @line = line
  end

  def message
    @line.split(' ')[1..].join(' ')
  end

  def log_level
    @line.split(':').first[1..-2].downcase
  end

  def reformat
    message.strip + " (#{log_level})"
  end
end
