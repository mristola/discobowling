class GameController < ApplicationController
 def index
  	playerList = []
  	rolls = 21
    currentRoll = 0
  end


  #Adds a player with the name given in the textbox in the view
  #Also adds an array with the same name of the player plus the string "Score" to hold individual player score
  def addPlayer(name)
  	name = textBoxName
  	playerList +=name
  	name + "Score" = Array.new
  end

  
  #Does all the rolls for each player in the playerlist array
  #------WIP-------------#
#  def roll(pins)
#    rolls[currentRoll++] = pins
#
#  	for player in playerList
#  		for i in rolls
#  			roll = rand(1...11)   
#   		end
#  	end
#
#  end
  #--------/-----------#

  
  #Calculates score for number of pins hit down each round/throw
  def score
    score = 0
    round = 0
    for frame in 0...10
      if Strike?(round) 
        score += 10 + strikeBonus(round)
        round++
      elsif Spare?(round)
        score += 10 + spareBonus(round)
        round += 2
      else 
        score += scoreInRound(round)
        round += 2
      end
    end
    return score
  end

  #Returns true if strike (10 pins)
  def Strike?(round)
    return rolls[round] == 10;
  end
  #Returns true if spare (10 pins in 2 throws)
  def Spare?(round)
    return rolls[round] + rolls[round+1] == 10
  end
  #Returns the score of the roll
  def scoreInRound(round)
    return rolls[round] + rolls[round+1]
  end
  #Returns bonus points if strike (the values of the two next rolls[]-slots)
  def strikeBonus(round)
    return rolls[round+1] + rolls[round+2];
  end
  #Returns bonus points if spare (the value of the second next rolls[]-slot)
  def spareBonus(round)
    return rolls[round+2]
  end

end
