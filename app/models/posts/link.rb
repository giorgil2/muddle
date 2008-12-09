# TODO: tags
# TODO: post out to del.icio.us

require 'rubygems'
require 'hpricot'
require 'open-uri'

class Link < Post

  property :url, String, { :nullable => false }
  property :title, String, { :nullable => false }
  property :notes, Text, { :lazy => false }

  before(:valid?) do
    unless @title && !@title.empty?
      doc = Hpricot(open(url))
      @title = doc.at('title').inner_html
    end
  end

end
