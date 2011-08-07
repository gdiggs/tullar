class Shell
  COLORS = {
    :clear => "\e[0m",
    :cyan => "\e[36m"
  }

  def self.in_color(text, color)
    COLORS[color] + text + COLORS[:clear]
  end
end
