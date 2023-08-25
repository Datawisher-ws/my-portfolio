game <- c("rock", "paper", "scissors")

play_game <- function() {
  count <- 0
  wins <- 0
  losses <- 0
  
  while (TRUE) {
    user_game <- readline("Let's play a game!")
    
    if (user_game == "exit") {
      break
    }
    
    if (user_game %in% game) {
      count <- count + 1
      computer_game <- sample(game, 1)
      cat("Computer plays:", computer_game, "\n")
      
      if (user_game == computer_game) {
        cat("It's a tie!\n")
      } else if ((user_game == "rock" && computer_game == "scissors") ||
                 (user_game == "paper" && computer_game == "rock") ||
                 (user_game == "scissors" && computer_game == "paper")) {
        cat("You win!\n")
        wins <- wins + 1
      } else {
        cat("Computer wins!\n")
        losses <- losses + 1
      }
    } else {
      cat("Invalid input. Please try again.\n")
    }
  }
  
  cat("Total games played:", count, "\n")
  cat("Total wins:", wins, "\n")
  cat("Total losses:", losses, "\n")
  cat("Thank you for playing!\n")
}

# Calling the play_game function
play_game()
