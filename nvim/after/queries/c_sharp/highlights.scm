;; extends

([
  "true"
  "false"
] @boolean.override (#set! priority 200))


((null_literal) @constant.builtin.override (#set! priority 200))

(constructor_initializer "base" @constructor.override (#set! priority 200))

([
  "assembly"
  "module"
  "this"
  "base"
] @variable.builtin.override (#set! priority 150))
