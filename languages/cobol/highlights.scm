; highlights.scm

; Keywords
"IDENTIFICATION" @keyword
"ENVIRONMENT" @keyword
"DATA" @keyword
"PROCEDURE" @keyword
"DIVISION" @keyword
"PROGRAM-ID" @keyword
"AUTHOR" @keyword
"INSTALLATION" @keyword
"DATE-WRITTEN" @keyword
"CONFIGURATION" @keyword
"INPUT-OUTPUT" @keyword
"SECTION" @keyword
"SOURCE-COMPUTER" @keyword
"FILE-CONTROL" @keyword
"FILE" @keyword
"WORKING-STORAGE" @keyword
"SELECT" @keyword
"ASSIGN" @keyword
"TO" @keyword
"PIC" @keyword
"VALUE" @keyword
"USING" @keyword
"MOVE" @keyword
"DISPLAY" @keyword
"STOP" @keyword
"RUN" @keyword
"IF" @keyword
"THEN" @keyword
"ELSE" @keyword
"END-IF" @keyword
"PERFORM" @keyword
"COPY" @keyword

; Operators
"=" @operator
"EQUAL" @operator
"<" @operator
">" @operator
"<=" @operator
">=" @operator
"<>" @operator

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

