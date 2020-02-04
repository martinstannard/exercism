class ResistorColorDuo
  BANDS = %w[black brown red orange yellow green blue violet grey white]

  def self.value(colors)
    colors.take(2).reduce('') do |str, c|
      str + index(c).to_s
    end.to_i
  end

  private

  def self.index(color)
    BANDS.index(color)
  end

end
