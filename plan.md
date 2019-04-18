0. welcome!

1. show player turn, show commands, show board

2. wait for player input

3. analyze input > go to 4. if ok / go to 2. if error

4. if input = command
     execute command
     go back to 2.

   if input = play
     execute play
     check for victory > go to 7. if victory / go to 5. if !victory

5. check for tie > go to 8. if tie / go to 6. if !tie

6. change current player and go back to 1.

7. current player victories ++

8. play again? > reset board, change player turn and go back to 1. if true / go to 9. if false

9. show total score and bye!
