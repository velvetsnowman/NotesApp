To play around with my code follow these instructions:

* In your terminal in the directory you wish run

```
* git clone https://github.com/velvetsnowman/notesapp.git
* cd notesapp
```
```
* irb
* require './lib/notebook.rb'
* notebook = Notebook.new
* notebook.notebook_menu

```

* You should see something like this:

```
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
1. INPUT A NEW NOTE
2. SHOW ME ALL MY NOTES
3. PICK A NOTE
4. SAVE MY NOTES
5. LOAD MY SAVED NOTES
9. EXIT
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
```
* Within your terminal, type the number of the option you wish to choose, I recommend inputting `1`
* Enjoy


## User Stories

```
As a user,
I want to add a note with a title and a body
```
```
As a user,
I want to see a list of all the note titles
```
```
As a user,
I want to be able to pick a note and see its title and body.
```
