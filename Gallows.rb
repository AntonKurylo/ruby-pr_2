require_relative "GallowsMethods"

puts "Вас приветствует игра \"Виселица!\""

letters = get_letters
errors = 0
correct_letters = []
wrong_letters = []

while errors < 7 do
  print_status(letters, correct_letters, wrong_letters, errors)
  user_input = get_user_input
  result = check_result(user_input, letters, correct_letters, wrong_letters)

  if result == -1
    errors += 1
  elsif result == 1
    break
  end

end

print_status(letters, correct_letters, wrong_letters, errors)