class Speech
  DEFAULT_VOICE = "Ralph" # Ralph is closest to the old IIGS voice
  
  def self.say(text)
    `say -v #{DEFAULT_VOICE} #{text}`
  end
end
