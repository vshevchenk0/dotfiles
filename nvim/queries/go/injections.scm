; extends
; inject sql into any const string with word query in the name
; e.g. const query = `SELECT * FROM users WHERE name = 'John'`;
(const_spec
  name: (identifier) @_name (#match? @_name "[Q|q]uery")
  value: (expression_list
    [
      (raw_string_literal)
      (interpreted_string_literal)
    ] @injection.content
    (#offset! @injection.content 0 1 0 -1)
    (#set! injection.language "sql")))

; inject sql in queries of corresponding methods
(call_expression
  (selector_expression
    field: (field_identifier) @_field (#any-of? @_field "GetContext" "ExecContext" "SelectContext"))
  (argument_list
    [
      (raw_string_literal)
      (interpreted_string_literal)
    ] @injection.content
    (#offset! @injection.content 0 1 0 -1)
    (#set! injection.language "sql")))

; inject sql in any variable named query with string value
(short_var_declaration
  left: (expression_list
    (identifier) @_left (#match? @_left "query"))
  right: (expression_list
    [
      (raw_string_literal)
      (interpreted_string_literal)
    ] @injection.content
    (#offset! @injection.content 0 1 0 -1)
    (#set! injection.language "sql")))
