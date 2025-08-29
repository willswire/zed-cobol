; highlights.scm

; Keywords
[
  "IDENTIFICATION"
  "ENVIRONMENT"
  "DATA"
  "PROCEDURE"
  "DIVISION"
  "PROGRAM-ID"
  "AUTHOR"
  "INSTALLATION"
  "DATE-WRITTEN"
  "CONFIGURATION"
  "INPUT-OUTPUT"
  "SECTION"
  "SOURCE-COMPUTER"
  "FILE-CONTROL"
  "FILE"
  "WORKING-STORAGE"
  "SELECT"
  "ASSIGN"
  "TO"
  "PIC"
  "VALUE"
  "USING"
  "MOVE"
  "DISPLAY"
  "STOP"
  "RUN"
  "IF"
  "THEN"
  "ELSE"
  "END-IF"
  "PERFORM"
  "COPY"
] @keyword

; Operators
[
  "="
  "EQUAL"
  "<"
  ">"
  "<="
  ">="
  "<>"
] @operator

; Identifiers
(identifier) @variable

; Literals
(string_literal) @string
(picture_string) @string.special
(level_number) @number
(number_literal) @number

; Comments
(comment) @comment

; Sections
(identification_division) @section
(environment_division) @section
(data_division) @section
(procedure_division) @section
(configuration_section) @section
(input_output_section) @section
(file_control_paragraph) @section
(working_storage_section) @section
(file_section) @section

; Statements
(move_statement) @statement
(display_statement) @statement
(perform_statement) @statement
(if_statement) @statement
(stop_statement) @statement
(copy_statement) @statement
(select_statement) @statement

