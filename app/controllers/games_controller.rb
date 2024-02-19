require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = []
    10.times do
      @letters << ('A'..'Z').to_a.sample
    end
  end

  def score

    # We want to handle three scenarios:
    #   The word can’t be built out of the original grid ❌


    #   The word is valid according to the grid, but is not a valid English word ❌
    #   The word is valid according to the grid and is an English word ✅
    #   binding.break
    word = params[:word]

    url = "https://wagon-dictionary.herokuapp.com/#{word}"

    data = JSON.parse(URI.open(url).read)

    # if (data[:found] == true) &&

    # else
    # end
  end
end
