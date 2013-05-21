class Hangman
  attr_accessor :guess_number, :word_in_progress, :guess_attempts, :answer, :wrong_guesses

  def initialize(answer, guess_attempts)
    @answer = Hash.new
    sanitize(answer).split("").each_with_index do |letter, index|
      @answer[index.to_s] = letter
    end
    @guess_attempts = guess_attempts
    setup_game
  end

  def setup_game
    @guess_number = 0
    @solved = false
    @word_in_progress = Array.new(word_length, "_")
    @wrong_guesses = []
  end

  def sanitize(word)
    word.chomp.downcase.gsub(" ", "")
  end

  def original_answer
    answer.values.join("")
  end

  def word_length
    @answer.length
  end

  def display_word_in_progress
    word_in_progress.join("  ")
  end

  def winning_message
    puts "Congratulations! You figured out the word was ---> #{original_answer.upcase} <---"
  end

  def lossing_message
    puts "You have lost! And a man has been hanged for your inabilities."
    puts "The secret word was ---> #{original_answer.upcase} <---"
  end

  def solved?
    @solved
  end

  def unsolved?
    true if word_in_progress.include?("_")
  end

  def out_of_guesses?
    guess_number == guess_attempts
  end

  def increment_guess_number
    self.guess_number += 1
  end

  def last_guess?
    guess_attempts - guess_number == 1
  end

  def guesses_left
    if last_guess?
      "Final guess!"
    else
      "You have #{guess_attempts - guess_number} guesses left"
    end
  end

  def current_state_of_game
    if solved?
      winning_message
    elsif out_of_guesses?
      lossing_message
    else
      puts "#{guesses_left}: \t #{display_word_in_progress}"
      puts ""
    end
  end

  def explain_rules
    puts <<-eos
       Rules
       **********************************************************************
       The word is #{word_length} letters long and you have #{guess_attempts} guess attempts.
       At anytime you can guess the word.
       If it's incorrect, it will count as a guess attempt.
       You can end a game early by typing "quit"
       **********************************************************************
    eos
  end

  def play
    explain_rules
    until solved? || out_of_guesses? do
      if last_guess?
        printf "No more hints! Time to guess the word:"
        puts ""
        last_guess = sanitize(gets)
        word_guess(last_guess)
      else
        printf "Guess a letter or word:"
        user_input = sanitize(gets)
        return if parse(user_input) == "quit"
      end
      increment_guess_number
      current_state_of_game
    end
    puts "Thanks for playing"
  end

  def word_guess(user_input)
    if user_input == original_answer
      @solved = true
    else
      puts "Miso sorri - incorrect word"
    end
  end

  def parse(user_input)
    if user_input == "quit"
      "quit"
    elsif user_input.length > 1
      word_guess(user_input)
    else
      letter_guess(user_input)
    end
  end

  def letter_guess(user_input)
    if @answer.has_value?(user_input)
      puts "Correct!"
      matches = @answer.select { |k,v| v == user_input }
      letter = matches.values.first
      positions = matches.keys.map(&:to_i)
      fill_in(letter, positions)
    else
      wrong_guesses << user_input.upcase
      puts "Dagnabit, no #{user_input}'s"
    end
    puts "Wrong guesses thus far: #{wrong_guesses.join(" ")}"
  end

  def fill_in(letter, positions)
    positions.each do |position|
      self.word_in_progress = word_in_progress.insert(position, letter)
      word_in_progress.delete_at(position+1)
    end
  end
end

print "Before starting the game, please select the secret word: "
secret_word = gets.chomp
print "How many guesses would you like to give your opponent to figure it out: "
guesses = gets.chomp.to_i
new_game = Hangman.new(secret_word, guesses)
new_game.play

