class Story
  STORY_DIR = "./stories"
  attr_accessor :body, :words

  def initialize
    @stories ||= Dir.open(STORY_DIR).grep(/\.tullar/)
    story_index = rand(@stories.count)
    self.body = File.read("#{STORY_DIR}/#{@stories[story_index]}")
    self.words = []
  end

  def fill_in
    body.split(' ').each do |word|
      if word.match(/:.*:/)
        self.words << Word.new(ask_for(word), :keyword => true)
      else
        self.words << Word.new(word)
      end
    end
    puts "Thanks!"
  end

  def read
    Speech.say self.words.join(' ')
  end

  def show
    puts self.words_with_color
  end

  def show_and_read
    self.read
    self.show
  end

  def words_with_color
    self.words.map{ |w| w.with_color }.join(' ')
  end
  
  private
  def ask_for(term)
    new_term = term.gsub(/:/, '').gsub(/_/, ' ')
    printf "Please enter a '#{Shell.in_color(new_term, :cyan)}'\t"
    term.gsub(/:.*:/, gets.strip)
  end
end


