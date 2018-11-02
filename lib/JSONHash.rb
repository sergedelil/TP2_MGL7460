# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require 'json'
require_relative "message"

include Message

class JSONHash
  
  attr_accessor :filename, :json
  
  def initialize(file={})
    @filename = file
    #@json = ""
  end
  
  def load()
    if is_file()
      if valid_json()
        return @json
      else
        message = "Le fichier JSON n est pas valide"
        error_handle(message)
      end
    else
      message = "Le fichier d entree n exite pas"
      error_handle(message)
    end
  end
  
  def valid_json()
    @json = JSON.parse(File.read(@filename))
    return true
  rescue JSON::ParserError
    return false
end
  
  def is_file()
    return File.exist?(@filename)
  end
  
  def self.from(file)
    self.new.load(file)
  end
  
  # Save this to disk, optionally specifying a new location
  def save(obj)
    @json = JSON.parse(obj)
    File.open(@filename,"w") do |f|
      f.write(JSON.pretty_generate(@json))
    end
    self
  end
  
  def to_json
    @h.to_json
  end
  
  
  


  
end
