; highlights.scm

; Keywords
"IDENTIFICATION DIVISION." @keyword
"ENVIRONMENT DIVISION." @keyword
"DATA DIVISION." @keyword
"PROCEDURE DIVISION." @keyword
"WORKING-STORAGE SECTION." @keyword
"FILE SECTION." @keyword
"CONFIGURATION SECTION." @keyword
"PIC" @keyword
"MOVE" @keyword
"TO" @keyword
"DISPLAY" @keyword
"PERFORM" @keyword
"IF" @keyword
"EQUAL" @keyword
"STOP" @keyword
"RUN" @keyword
"BEGIN" @keyword
"VARYING" @keyword
"UNTIL" @keyword

; Paragraph Labels
(paragraph_label) @label

; Indices
(index_line (number_literal) @number)

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
(working_storage_section) @section
(file_section) @section

; Statements
(move_statement) @statement
(display_statement) @statement
(perform_statement) @statement
(if_statement) @statement
(stop_statement) @statement
(begin_statement) @statement

; Paragraphs
(paragraph (paragraph_label) @function)
