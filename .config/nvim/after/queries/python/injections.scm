; extends

((call
  function: (attribute
    attribute: (identifier) @_method)
  arguments: (argument_list
    .
    [
      (string
        (string_content) @injection.content)
      (concatenated_string
        (string
          (string_content) @injection.content))
    ]))
 (#eq? @_method "sql")
 (#set! injection.language "sql")
 (#set! injection.combined))

; GraphQL query/mutation assigned to a variable, e.g. `query = """..."""`
((assignment
  left: (identifier) @_name
  right: (string
    (string_content) @injection.content))
 (#any-of? @_name "query" "mutation" "gql" "graphql" "subscription")
 (#set! injection.language "graphql")
 (#set! injection.combined))

; Django RunSQL keyword args
((keyword_argument
  name: (identifier) @_name
  value: (string
    (string_content) @injection.content))
 (#any-of? @_name "sql" "reverse_sql")
 (#set! injection.language "sql")
 (#set! injection.combined))

; Module docstring
(module .
  (expression_statement
    (string
      (string_content) @injection.content))
  (#set! injection.language "rst"))

; Class docstring
(class_definition
  body: (block .
    (expression_statement
      (string
        (string_content) @injection.content)))
  (#set! injection.language "rst"))

; Function/method docstring
(function_definition
  body: (block .
    (expression_statement
      (string
        (string_content) @injection.content)))
  (#set! injection.language "rst"))
