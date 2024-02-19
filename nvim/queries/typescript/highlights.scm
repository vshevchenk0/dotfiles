;; extends

; import
(import_statement
  (import_clause
    (named_imports
      (import_specifier
        name: (identifier) @import))))

; new *Class*()
(new_expression
  constructor: (identifier) @constructor.call
)

; class *NewClass*
(declaration
  name: (type_identifier) @class.name
)

; Promise<>
(generic_type
  name: (type_identifier) @type
)

; @Decorator(*arg*)
(decorator
  (call_expression
    (arguments
      (identifier) @decorator.args
    )
  )
)

; @Decorator(*Object*.arg)
(decorator
  (call_expression
    (arguments
      (member_expression
        object: (identifier) @decorator.args
      )
    )
  )
)

; object.*field*
(member_expression
  property: (property_identifier) @property.value
)

; this.*object*.method()
(call_expression
  (member_expression
    (member_expression
      property: (property_identifier) @property.source
    )
  )
)
