#!/usr/bin/env ruby


# tullar, a Mad Libs clone in ruby
# Gordon Diggs - 2011

class Story
  DEFAULT_VOICE = "Alex"
  attr_accessor :body, :tullar_file

  def initialize
    self.tullar_file = File.read("./stories/sample_story.tullar")
  end

  def fill_in
    self.body = ''
    tullar_file.split(' ').each do |word|
      word = ask_for(word) if word.match(/:.*:/)
      self.body << "#{word} "
    end
  end

  def read
    `say -v #{DEFAULT_VOICE} #{self.body}`
  end

  def show
    printf "#{self.body}\n"
  end

  def show_and_read
    self.read
    self.show
  end
  
  private
  def ask_for(term)
    term = term.gsub(/:/, '').gsub(/_/, ' ')
    printf "Please enter a '#{term}'    "
    gets.strip
  end
end

story = Story.new
story.fill_in
story.show_and_read
