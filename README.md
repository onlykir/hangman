=====================
A console game for guessing words by letter!
-----------------------------------
### Requirements:
```
ruby '2.5.0' or newer
```

### Installation:
```
git clone git@github.com:onlykir/hangman.git
```

### Running:
To run the application, you need to run `bundle` in the application directory to install all the necessary gems.

+ go to the desired directory
```
cd hangman
```
+ catch the necessary gems
```
bundle install
``` 
+ launch
```
bundle exec ruby main.rb
``` 

### Demo:
![hang](https://user-images.githubusercontent.com/71513174/117373915-d41e7e00-aed4-11eb-97e6-07d81f56378e.gif)

### Rules of the game:
You have several attempts to guess the word. 
You enter a letter and if this letter is contained in a word, 
then this letter will open all empty cells of the word on which this letter stood. 
If the letter is wrong, then you are using one mistake. 
The game will go on until you guess the word or until you use all your attempts.

### How to add new words to the game:
The game files have a file called `"words.txt".` 
You need to add a word to it on a new line if you want it to be displayed in the game.

*Important: each word in the file must be on a new line!*
