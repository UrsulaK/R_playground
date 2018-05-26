print("This is a Game for guessing a number between 0 and 100")
print("Now I choose a number.")
number <- sample(0:100, 1)
notFound <- TRUE
guessedNumber <- as.integer(readline(prompt="Guess the number between 0 and 100: "))
while (notFound) {
  if (guessedNumber > number) {
    cat(guessedNumber, " is too big")
    guessedNumber <- as.integer(readline(prompt="Guess the number between 0 and 100: "))
  } else if (guessedNumber < number) {
    cat(guessedNumber, " is too small")
    guessedNumber <- as.integer(readline(prompt="Guess the number between 0 and 100: "))
  } else {
    cat("Congratulations You are right the number is ", number)
    notFound <- FALSE
  } 
}
