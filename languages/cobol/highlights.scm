; Keywords
[
  "IDENTIFICATION" "DIVISION" "PROGRAM-ID"
  "DATA" "WORKING-STORAGE" "SECTION"
  "PROCEDURE" "STOP" "RUN"
  "IF" "ELSE" "END-IF" "PERFORM"
  "MOVE" "TO" "DISPLAY" "ACCEPT"
  "ADD" "SUBTRACT" "MULTIPLY" "DIVIDE"
] @keyword

; Comments
(comment) @comment

; Strings
(string) @string

; Numeric literals
(number) @number

; Operators and Punctuation
[
  "=" "+" "-" "*" "/" "<" ">" ">=" "<=" "<>"
  "." "," ";" ":" "()"
] @operator

; Variables (identifiers)
(variable) @variable
