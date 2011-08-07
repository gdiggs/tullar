class Word
  attr_accessor :body, :is_keyword
 
  def initialize(body, options = {})
    self.body = body
    self.is_keyword = !!options[:keyword]
  end

  def to_s
    self.body
  end

  def with_color
    if self.is_keyword
      Shell.in_color self.body, :cyan
    else
      self.body
    end
  end
end
