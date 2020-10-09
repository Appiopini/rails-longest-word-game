require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    alphabet = ('A'..'Z').to_a
    @letters = ""
    10.times { @letters += alphabet.sample }
  end

  def score
    @word = params[:word].upcase
    @grid = params[:grid]

    valid_in_grid = @word.chars.all? { |letter| @word.count(letter) <= @grid.count(letter) }

    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    response = open(url).read

    parsed = JSON.parse(response)

    valid_in_dict = parsed["found"]

    if valid_in_dict && valid_in_grid
      @score = @word.size * 100
    else
      @score = 0
    end
  end
end
