      ******************************************************************
      * Author:Felix Ordonez
      * Date:10/18/2020
      * Purpose:Learn basic cobol
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. HELLO.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
*     * A record that describes a user
       01 WS-USER.
           05 WS-FIRST-NAME    PIC a(10).
           05 WS-LAST-NAME     PIC a(10).
           05 WS-AGE           PIC 9(2).
       01 WS-FULL-NAME         PIC a(20).
       01 WS-CLOSE             PIC a(1).
       01 WS-NEW-AGE           PIC 9(2).
       01 WS-AGE-DELTA         PIC 9(2) VALUE 10.

       PROCEDURE DIVISION.
      * Run all functions
       PERFORM START-UP
       PERFORM GET-DATA
       PERFORM CALC-DATA
       PERFORM SHOW-DATA
       PERFORM FINISH-UP
       GOBACK.

      *A paragraph to get use input
       GET-DATA.
           MOVE SPACE TO WS-USER WS-FULL-NAME
           DISPLAY "What is your first name?"
           ACCEPT WS-FIRST-NAME OF WS-USER
           DISPLAY "WHAT IS YOUR LAST NAME?"
           ACCEPT WS-LAST-NAME OF WS-USER
           DISPLAY "WHAT IS YOUR PAGE"
           ACCEPT WS-AGE OF WS-USER
           STRING WS-FIRST-NAME OF WS-USER DELIMITED BY SPACE
           SPACE DELIMITED BY SIZE
               WS-LAST-NAME OF WS-USER DELIMITED BY SPACE
               SPACE DELIMITED BY SIZE
               INTO WS-FULL-NAME
               ON OVERFLOW
               DISPLAY "SORRY, DATA WAS TRUNCATED"
           END-STRING.

      *just an opener to remind myself
       START-UP.
           DISPLAY "Hello World".

       CALC-DATA.
           add ws-age-delta ws-age of ws-user to WS-NEW-AGE.

       SHOW-DATA.
           DISPLAY "WELCOME " WS-FULL-NAME "IN TEN YEARS YOU WILL BE: "
           WS-NEW-AGE.

       FINISH-UP.
           DISPLAY "STRIKE ANY KEY TO CONTINUE".
           ACCEPT WS-CLOSE
           DISPLAY "GOOD BYE".


       END PROGRAM HELLO.
