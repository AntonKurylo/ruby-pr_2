def get_letters
  word = ""

  while word == "" do
    puts "\nВведите загаданное слово: "
    word = STDIN.gets.encode("UTF-8").chomp
  end

  return word.upcase.split("")
end

def get_user_input
  letter = ""

  while letter == "" do
    puts "\nВведите следующую букву: "
    letter = STDIN.gets.encode("UTF-8").chomp
  end

  return letter.upcase
end

def check_result(user_input, letters, correct_letters, wrong_letters)
  if correct_letters.include?(user_input) || wrong_letters.include?(user_input)
    puts "\nБуква уже вводилась."
    return 0
  end

  if letters.include?(user_input)
    correct_letters << user_input

    if correct_letters.uniq.size == letters.uniq.size
      return 1
    else
      puts "\nВы отгадали букву."
      return 0
    end
  else
    puts "\nТакой буквы нет."
    wrong_letters << user_input
    return -1
  end
end

def print_status(letters, correct_letters, wrong_letters, errors)
  puts "\nСлово: #{get_word_for_print(letters, correct_letters)}"
  puts "Ошибки (#{errors}): #{wrong_letters.join(", ")}"

  if errors >= 7
    puts "Вы проиграли"
  else
    if letters.uniq.size == correct_letters.uniq.size
      puts "Поздравляем, Вы выиграли!\n"
    else
      puts "У Вас осталось попыток: #{(7 - errors)}"
    end
  end
end

def get_word_for_print(letters, correct_letters)
  result = ""

  letters.each do |item|
    if correct_letters.include?(item)
      result += item + " "
    else
      result += "__ "
    end
  end

  return result
end
