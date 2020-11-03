class Game
  # Количество допустимых ошибок
  TOTAL_ERRORS_ALLOWED = 7

  # Конструктор класса Game на вход получает строку с загаданным словом.
  #
  # В конструкторе инициализируем две переменные экземпляра: массив букв
  # загаданного слова и пустой массив для дальнейшего сбора в него вводимых
  # букв.
  def initialize(word)
    @letters = word.chars
    @user_guesses = []
  end
  # Методы, позволяющие игнорировать ё/е й/b
  def equal_letters(letter)
    return 'Е' if letter == 'Ё'
    return 'И' if letter == 'Й'
    letter
  end

  def word_with_equal_letters
    @letters.map do |letter|
      equal_letters(letter)
    end
  end
  # Возвращает массив букв, введенных пользователем, но отсутствующих в
  # загаданном слове (ошибочные буквы)
  def errors
    @user_guesses - word_with_equal_letters
  end

  # Возвращает количество ошибок, сделанных пользователем
  def errors_made
    errors.length
  end

  # Отнимает от допустимого количества ошибок число сделанных ошибок и
  # возвращает оставшееся число допустимых ошибок
  def errors_allowed
    TOTAL_ERRORS_ALLOWED - errors_made
  end

  # Возвращает массив с уже отгаданными буквами, вместо неотгаданных букв в
  # массиве на соответствующем месте находится nil. Этот массив нужен методу
  # экземпляра класса ConsoleInterface для вывода слова на игровом табло.
  def letters_to_guess
    result =
      @letters.map do |letter|
        if @user_guesses.include?(equal_letters(letter))
          letter
        else
          nil
        end
      end
    result
  end

  # Возвращает true, если у пользователя не осталось ошибок, т.е. игра проиграна
  def lost?
    errors_allowed == 0
  end

  # Возвращает true, если игра закончена (проиграна или выиграна)
  def over?
    won? || lost?
  end

  # По сути, это основной игровой метод, типа "сыграть букву".
  #
  # Если игра не закончена и передаваемая буква отсутствует в массиве
  # введённых букв, то закидывает передаваемую букву в массив "попыток".
  def play!(letter)
    if !over? && !@user_guesses.include?(equal_letters(letter))
      @user_guesses << equal_letters(letter)
    end
  end

  # Возвращает true, если не осталось неотгаданных букв (пользователь выиграл)
  def won?
    (word_with_equal_letters - @user_guesses).empty?
  end

  # Возвращает загаданное слово, склеивая его из загаданных букв
  def word
    @letters.join
  end
end
