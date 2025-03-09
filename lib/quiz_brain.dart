import 'dart:math';

import 'question.dart';

class QuizBrain {
  int _currentIndex = 0;
  List<Question> _shuffledQuestionBank = [];
  final List<Question> _questionBank = [
    Question(
        questionText: 'Some cats are actually allergic to humans',
        questionAnswer: true),
    Question(
        questionText: 'You can lead a cow down stairs but not up stairs.',
        questionAnswer: false),
    Question(
        questionText:
            'Approximately one quarter of human bones are in the feet.',
        questionAnswer: true),
    Question(questionText: 'A slug\'s blood is green.', questionAnswer: true),
    Question(
        questionText: 'Buzz Aldrin\'s mother\'s maiden name was "Moon".',
        questionAnswer: true),
    Question(
        questionText: 'It is illegal to pee in the Ocean in Portugal.',
        questionAnswer: true),
    Question(
        questionText:
            'No piece of square dry paper can be folded in half more than 7 times.',
        questionAnswer: false),
    Question(
        questionText:
            'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        questionAnswer: true),
    Question(
        questionText:
            'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        questionAnswer: false),
    Question(
        questionText:
            'The total surface area of two human lungs is approximately 70 square metres.',
        questionAnswer: true),
    Question(
        questionText: 'Google was originally called "Backrub".',
        questionAnswer: true),
    Question(
        questionText:
            'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        questionAnswer: true),
    Question(
        questionText:
            'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        questionAnswer: true),
    Question(
        questionText: 'HTML is used to structure web pages.',
        questionAnswer: true),
    Question(
        questionText: 'CSS stands for Cascading Style Sheets.',
        questionAnswer: true),
    Question(
        questionText: 'JavaScript can only be used on the client side.',
        questionAnswer: false),
    Question(
        questionText: 'Python is a statically typed language.',
        questionAnswer: false),
    Question(
        questionText: 'Flutter is a framework for building native mobile apps.',
        questionAnswer: true),
    Question(
        questionText: 'Dart is the primary programming language for Flutter.',
        questionAnswer: true),
    Question(
        questionText: 'C++ is an extension of C language.',
        questionAnswer: true),
    Question(
        questionText: 'PHP is not a scripting language.',
        questionAnswer: false),
    Question(
        questionText: 'SQL is used to create APIs.', questionAnswer: false),
    Question(
        questionText: 'Git is a version control system.', questionAnswer: true),
    Question(
        questionText: 'The first computer virus was created in the 2000s.',
        questionAnswer: false),
    Question(
        questionText: 'React is maintained by Facebook.', questionAnswer: true),
    Question(
        questionText: 'Java supports multiple inheritance directly.',
        questionAnswer: false),
    Question(
        questionText: 'HTTP stands for HyperText Transfer Protocol.',
        questionAnswer: true),
    Question(
        questionText: 'Linux is an open-source operating system.',
        questionAnswer: true),
    Question(
        questionText: 'An array in Python is called a list.',
        questionAnswer: true),
    Question(
        questionText: 'Machine learning is a subset of AI.',
        questionAnswer: true),
    Question(
        questionText:
            'Node.js is a backend runtime environment for JavaScript.',
        questionAnswer: true),
    Question(
        questionText: 'CSS Flexbox is used to create responsive layouts.',
        questionAnswer: true),
    Question(
        questionText: 'A class and object are the same in OOP.',
        questionAnswer: false),
    Question(
        questionText: 'RAM is used for long-term storage.',
        questionAnswer: false),
    Question(
        questionText: 'MySQL is an example of a NoSQL database.',
        questionAnswer: false),
    Question(
        questionText: 'Null is a data type in JavaScript.',
        questionAnswer: true),
    Question(questionText: 'REST APIs are stateless.', questionAnswer: true),
    Question(
        questionText: 'TypeScript is a superset of JavaScript.',
        questionAnswer: true),
    Question(
        questionText: 'CSS Grid is a tool for creating animations.',
        questionAnswer: false),
    Question(
        questionText: 'The DOM represents the structure of a webpage.',
        questionAnswer: true),
    Question(
        questionText: 'Binary numbers are represented using 1s and 0s.',
        questionAnswer: true),
    Question(
        questionText: 'Functions in Dart must always return a value.',
        questionAnswer: false),
    Question(
        questionText: 'HTTP status code 404 means "Not Found".',
        questionAnswer: true),
    Question(
        questionText: 'JSON stands for JavaScript Object Notation.',
        questionAnswer: true),
    Question(
        questionText: 'The programming language Kotlin is statically typed.',
        questionAnswer: true),
    Question(
        questionText: 'The "for" loop in Python requires curly braces.',
        questionAnswer: false),
    Question(
        questionText: 'Virtual Reality is the same as Augmented Reality.',
        questionAnswer: false),
    Question(
        questionText: 'Flutter can only be used to build Android apps.',
        questionAnswer: false),
    Question(
        questionText: 'JavaScript is compiled before execution.',
        questionAnswer: false),
    Question(
        questionText: 'A function in C can return multiple values.',
        questionAnswer: false),
    Question(
        questionText: 'MongoDB is a relational database.',
        questionAnswer: false),
    Question(
        questionText: 'The "main()" function is the entry point in Dart.',
        questionAnswer: true),
    Question(
        questionText: 'Linux uses the EXT4 file system by default.',
        questionAnswer: true),
    Question(
        questionText: 'Flutter supports hot reload for faster development.',
        questionAnswer: true),
    Question(
        questionText: 'Python uses indentation to define blocks of code.',
        questionAnswer: true),
    Question(
        questionText: 'HTML is a programming language.', questionAnswer: false),
    Question(
        questionText: 'Docker is used to manage virtual machines.',
        questionAnswer: false),
    Question(
        questionText:
            'Dart supports async and await for handling asynchronous code.',
        questionAnswer: true),
    Question(
        questionText: 'Firebase is an open-source backend.',
        questionAnswer: false),
    Question(
        questionText: 'CSS allows animations using @keyframes.',
        questionAnswer: true),
    Question(
        questionText: 'The command "cd" is used to create a directory.',
        questionAnswer: false),
    Question(
        questionText: 'Flutter uses the Skia graphics engine.',
        questionAnswer: true),
    Question(
        questionText:
            'Python\'s "lambda" keyword is used for anonymous functions.',
        questionAnswer: true),
    Question(
        questionText: 'The Eiffel Tower is located in Paris.',
        questionAnswer: true),
    Question(
        questionText: 'The Great Wall of China can be seen from space.',
        questionAnswer: false),
    Question(
        questionText: 'Water boils at 100°C at sea level.',
        questionAnswer: true),
    Question(
        questionText: 'The capital of Australia is Sydney.',
        questionAnswer: false),
    Question(
        questionText: 'Mount Everest is the tallest mountain on Earth.',
        questionAnswer: true),
    Question(questionText: 'Bananas grow on trees.', questionAnswer: false),
    Question(
        questionText: 'The human body has 206 bones.', questionAnswer: true),
    Question(
        questionText: 'Venus is the closest planet to the Sun.',
        questionAnswer: false),
    Question(
        questionText: 'A group of lions is called a pride.',
        questionAnswer: true),
    Question(
        questionText: 'The Pacific Ocean is the smallest ocean.',
        questionAnswer: false),
    Question(
        questionText: 'Shakespeare wrote the novel "Pride and Prejudice".',
        questionAnswer: false),
    Question(questionText: 'The square root of 64 is 8.', questionAnswer: true),
    Question(questionText: 'The Moon is a planet.', questionAnswer: false),
    Question(
        questionText: 'The chemical symbol for gold is Au.',
        questionAnswer: true),
    Question(
        questionText: 'Mars is known as the Red Planet.', questionAnswer: true),
    Question(questionText: 'Penguins can fly.', questionAnswer: false),
    Question(
        questionText: 'The Statue of Liberty was a gift from France.',
        questionAnswer: true),
    Question(questionText: 'Bees are mammals.', questionAnswer: false),
    Question(
        questionText: 'The currency of Japan is Yen.', questionAnswer: true),
    Question(
        questionText: 'Albert Einstein invented the lightbulb.',
        questionAnswer: false),
    Question(
        questionText: 'Humans breathe out carbon dioxide.',
        questionAnswer: true),
    Question(questionText: 'Cows have four stomachs.', questionAnswer: true),
    Question(
        questionText: 'The color red is on the flag of Canada.',
        questionAnswer: true),
    Question(
        questionText: 'Pluto is no longer classified as a planet.',
        questionAnswer: true),
    Question(
        questionText: 'An octopus has three hearts.', questionAnswer: true),
    Question(questionText: 'The Earth has two moons.', questionAnswer: false),
    Question(
        questionText: 'The Nile is the longest river in the world.',
        questionAnswer: true),
    Question(
        questionText: 'Sound travels faster in air than in water.',
        questionAnswer: false),
    Question(
        questionText: 'Diamonds are made of carbon.', questionAnswer: true),
    Question(questionText: 'Horses sleep standing up.', questionAnswer: true),
    Question(
        questionText: 'Lightning never strikes the same place twice.',
        questionAnswer: false),
    Question(
        questionText: 'The chemical formula for water is H2O.',
        questionAnswer: true),
    Question(questionText: 'All mammals lay eggs.', questionAnswer: false),
    Question(
        questionText: 'The Earth\'s core is solid.', questionAnswer: false),
    Question(
        questionText: 'A crocodile can stick out its tongue.',
        questionAnswer: false),
    Question(
        questionText: 'The Great Barrier Reef is located in Australia.',
        questionAnswer: true),
    Question(
        questionText: 'An ostrich\'s eye is bigger than its brain.',
        questionAnswer: true),
    Question(
        questionText: 'The speed of light is faster than the speed of sound.',
        questionAnswer: true),
    Question(questionText: 'Cats are herbivores.', questionAnswer: false),
    Question(
        questionText: 'The piano is a string instrument.',
        questionAnswer: true),
    Question(
        questionText: 'The human brain is made of 80% water.',
        questionAnswer: true),
    Question(
        questionText: 'The Leaning Tower of Pisa is in Spain.',
        questionAnswer: false),
    Question(
        questionText: 'The currency of India is the Rupee.',
        questionAnswer: true),
    Question(
        questionText: 'Jupiter is the smallest planet in the solar system.',
        questionAnswer: false),
    Question(
        questionText: 'Venus is the hottest planet in the solar system.',
        questionAnswer: true),
    Question(
        questionText: 'Polar bears can live in Antarctica.',
        questionAnswer: false),
    Question(questionText: 'Honey never spoils.', questionAnswer: true),
    Question(
        questionText: 'Oxygen is the most abundant gas in the atmosphere.',
        questionAnswer: false),
    Question(
        questionText: 'A human can survive without water for a month.',
        questionAnswer: false),
    Question(questionText: 'A rainbow has seven colors.', questionAnswer: true),
    // Extended Programming Questions
    Question(
        questionText:
            'C# is primarily used for developing Windows applications.',
        questionAnswer: true),
    Question(
        questionText: 'JavaScript is used for styling webpages.',
        questionAnswer: false),
    Question(
        questionText: 'Ruby on Rails is a backend web framework.',
        questionAnswer: true),
    Question(
        questionText: 'Python does not support object-oriented programming.',
        questionAnswer: false),
    Question(
        questionText: 'Django is a Python framework.', questionAnswer: true),
    Question(
        questionText: 'HTTP is a stateful protocol.', questionAnswer: false),
    Question(
        questionText: 'Assembly language is a low-level programming language.',
        questionAnswer: true),
    Question(
        questionText: 'React Native is used for web development.',
        questionAnswer: false),
    Question(
        questionText: 'JSON stands for JavaScript Object Notation.',
        questionAnswer: true),
    Question(
        questionText: 'JavaScript does not support asynchronous programming.',
        questionAnswer: false),
    Question(
        questionText: 'CSS stands for Cascading Style Sheets.',
        questionAnswer: true),
    Question(
        questionText: 'A list in Python can hold multiple data types.',
        questionAnswer: true),
    Question(
        questionText: 'Kotlin is interoperable with Java.',
        questionAnswer: true),
    Question(
        questionText: 'Flutter is a library, not a framework.',
        questionAnswer: false),
    Question(
        questionText: 'PHP is primarily used for database management.',
        questionAnswer: false),
    Question(
        questionText: 'Dart supports static typing.', questionAnswer: true),
    Question(
        questionText: 'SQL is a programming language.', questionAnswer: false),
    Question(questionText: 'HTML is case-sensitive.', questionAnswer: false),
    Question(
        questionText: 'The "print" function in Python outputs to the console.',
        questionAnswer: true),
    Question(questionText: 'Node.js is written in C.', questionAnswer: false),
    Question(
        questionText: 'A tuple in Python is immutable.', questionAnswer: true),
    Question(
        questionText: 'React is primarily used for backend development.',
        questionAnswer: false),
    Question(
        questionText: 'GitHub is a Git repository hosting service.',
        questionAnswer: true),
    Question(
        questionText: 'Linux uses the NTFS file system.',
        questionAnswer: false),
    Question(
        questionText: 'Python is an interpreted language.',
        questionAnswer: true),
    Question(
        questionText: 'CSS cannot create animations.', questionAnswer: false),
    Question(
        questionText: 'API stands for Application Programming Interface.',
        questionAnswer: true),
    Question(
        questionText: 'Firebase is used for frontend development.',
        questionAnswer: false),
    Question(
        questionText: 'MySQL is a relational database management system.',
        questionAnswer: true),
    Question(
        questionText: 'Swift is used for Android development.',
        questionAnswer: false),
    Question(
        questionText: 'Angular is a JavaScript framework.',
        questionAnswer: true),
    Question(
        questionText: 'An interface in Java can have implemented methods.',
        questionAnswer: false),
    Question(
        questionText: 'The Dart language is open-source.',
        questionAnswer: true),
    Question(
        questionText:
            'Virtual machines can run multiple operating systems simultaneously.',
        questionAnswer: true),
    Question(
        questionText: 'CSS Grid can be used to align items vertically.',
        questionAnswer: true),
    Question(
        questionText: 'The "echo" command in Bash outputs text.',
        questionAnswer: true),
    Question(
        questionText: 'Dart can be used for server-side programming.',
        questionAnswer: true),
    Question(
        questionText: 'TypeScript is not compatible with JavaScript.',
        questionAnswer: false),
    Question(
        questionText:
            'Docker containers are isolated environments for applications.',
        questionAnswer: true),
    Question(
        questionText: 'HTML cannot be used to display images.',
        questionAnswer: false),
    Question(
        questionText: 'The Python language was created by Guido van Rossum.',
        questionAnswer: true),
    Question(
        questionText: 'A Flutter Widget can have a child property.',
        questionAnswer: true),
    Question(
        questionText: 'SQL queries are case-sensitive.', questionAnswer: false),
    Question(
        questionText: 'CSS stands for Compact Style Sheets.',
        questionAnswer: false),
    Question(
        questionText: 'Version control is essential for team collaboration.',
        questionAnswer: true),
    Question(
        questionText: 'Flutter uses widgets for UI components.',
        questionAnswer: true),
    Question(
        questionText: 'JavaScript supports arrow functions.',
        questionAnswer: true),
    Question(
        questionText: 'Dart is a compiled language.', questionAnswer: true),

    Question(questionText: 'The Sun is a star.', questionAnswer: true),
    Question(
        questionText: 'The Great Wall of China is made entirely of stone.',
        questionAnswer: false),
    Question(questionText: 'Pluto is a gas giant.', questionAnswer: false),
    Question(questionText: 'The Moon has no atmosphere.', questionAnswer: true),
    Question(
        questionText: 'Electricity is measured in volts.',
        questionAnswer: false),
    Question(
        questionText: 'The Earth is the third planet from the Sun.',
        questionAnswer: true),
    Question(
        questionText: 'Venus has more moons than Mars.', questionAnswer: false),
    Question(
        questionText:
            'Oxygen is the most abundant element in the Earth\'s crust.',
        questionAnswer: true),
    Question(questionText: 'Cows are herbivores.', questionAnswer: true),
    Question(
        questionText: 'Goldfish have a memory span of 3 seconds.',
        questionAnswer: false),
    Question(
        questionText:
            'The Eiffel Tower is taller than the Empire State Building.',
        questionAnswer: false),
    Question(
        questionText: 'Antarctica is the coldest place on Earth.',
        questionAnswer: true),
    Question(questionText: 'Honey is produced by bees.', questionAnswer: true),
    Question(
        questionText: 'Water boils at 212°F at sea level.',
        questionAnswer: true),
    Question(
        questionText: 'The chemical symbol for iron is Fe.',
        questionAnswer: true),
    Question(
        questionText: 'The Earth rotates on its axis once every 24 hours.',
        questionAnswer: true),
    Question(questionText: 'A tomato is a vegetable.', questionAnswer: false),
    Question(questionText: 'Sharks are mammals.', questionAnswer: false),
    Question(
        questionText: 'The Pacific is the largest ocean.',
        questionAnswer: true),
    Question(
        questionText: 'A group of crows is called a murder.',
        questionAnswer: true),
    Question(
        questionText: 'Mount Everest is part of the Andes mountain range.',
        questionAnswer: false),
    Question(
        questionText: 'Lightning is hotter than the surface of the Sun.',
        questionAnswer: true),
    Question(
        questionText: 'Penguins can fly short distances.',
        questionAnswer: false),
    Question(
        questionText: 'The capital of Brazil is Rio de Janeiro.',
        questionAnswer: false),
    Question(
        questionText: 'The Mona Lisa is displayed in the Louvre.',
        questionAnswer: true),
    Question(
        questionText: 'The fastest land animal is the cheetah.',
        questionAnswer: true),
    Question(
        questionText: 'Polar bears have black skin under their white fur.',
        questionAnswer: true),
    Question(
        questionText: 'The Amazon River flows through Brazil.',
        questionAnswer: true),
    Question(
        questionText: 'Saturn is known for its rings.', questionAnswer: true),
    Question(
        questionText: 'Earth is the only planet with liquid water.',
        questionAnswer: false),
    Question(questionText: 'Mars is smaller than Earth.', questionAnswer: true),
    Question(
        questionText: 'Sound travels faster in air than in water.',
        questionAnswer: false),
    Question(questionText: 'Bananas grow on trees.', questionAnswer: false),
    Question(
        questionText: 'The largest desert in the world is the Sahara.',
        questionAnswer: false),
    Question(
        questionText: 'Ice floats in water because it is less dense.',
        questionAnswer: true),
  ];

  QuizBrain() {
    _shuffledQuestionBank = List.from(_questionBank)..shuffle(Random());
  }

  void nextQuestion() {
    if (_currentIndex < _shuffledQuestionBank.length - 1) {
      _currentIndex++;
    }
  }

  String questionText() {
    return _shuffledQuestionBank[_currentIndex].questionText;
  }

  bool questionAnswer() {
    return _shuffledQuestionBank[_currentIndex].questionAnswer;
  }

  bool isFinished() {
    if (_currentIndex >= 19) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _currentIndex = 0;
    _shuffledQuestionBank = List.from(_questionBank)..shuffle(Random());
  }
}
