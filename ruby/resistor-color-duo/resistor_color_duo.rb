class ResistorColorDuo
  BAND = %w[black brown red orange yellow green blue violet grey white]

  def self.value(colors)
    colors.take(2).reduce('') do |digits, color|
      digits << BAND.index(color).to_s
    end.to_i
  end
end
