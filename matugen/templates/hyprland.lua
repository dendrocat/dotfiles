<* for name, value in colors *>
{{ name | pascal_case }} = "{{ value.default.rgba }}"
<* endfor *>
