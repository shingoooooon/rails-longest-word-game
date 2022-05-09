require "open-uri"

class GamesController < ApplicationController
  def new
    @grid = ('a'..'z').to_a.sample(10)
  end

  def score
    @word = params[:word]
    @currentgrid = params[:grid].split

    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    serialized = URI.open(url).read
    english = JSON.parse(serialized)
    @english = english["found"]

    @ingrid = @word.chars.all? do |letter|
      @word.count(letter) <= @currentgrid.count(letter)
    end
  end
end
