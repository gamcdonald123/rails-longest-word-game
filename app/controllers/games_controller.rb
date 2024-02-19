require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = []
    10.times do
      @letters << ('A'..'Z').to_a.sample
    end
  end

  def score


    @final_score = 0
    # We want to handle three scenarios:
    #   The word can’t be built out of the original grid ❌
    grid = params[:letters].split
    word = params[:word].upcase
    answer_array = word.split('')
    answer_array.each do |letter|
      if grid.include?(letter)
        grid.delete_at(grid.index(letter))
        @final_score = 1
      else
        @result = "Sorry, but #{word} can't be built out of #{params[:letters]}"
        @final_score = 0
        break
      end
    end
    #   The word is valid according to the grid, but is not a valid English word ❌
    #   The word is valid according to the grid and is an English word ✅

    url = "https://wagon-dictionary.herokuapp.com/#{word}"

    data = JSON.parse(URI.open(url).read)

    if (data[:found] == true) && (@final_score == 1)
      @result = "Congratulations! #{word} is a valid English word!"
    elsif (data[:found] == false) && (@final_score == 1)
      @result = "Sorry, but #{word} is not a valid English word"
    elsif @final_score.zero?
      @result = "Sorry, but #{word} can't be built out of #{params[:letters]}"
    end

    # raise

  end
end
