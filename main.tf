##############################################################################
# Main
##############################################################################

locals {
  # If prefix is not null, add prefix and a dash before the key
  key_prefix = var.prefix == null ? "" : "${var.prefix}-"

  # Create regular expression to look up true and false values
  lookup_regex = var.contains == null ? "" : var.contains ? "^true$" : "false|null"

  # Convert list to map
  list_to_map = {
    for item in var.list :
    ("${local.key_prefix}${item[var.key_name_field]}") =>
    item if(
      var.lookup_field == null
      ? true # when not checking the list object for a value, always true
      : can( # Returns true for matching regex, false for not matching
        regex(
          # Check regex value against actual value
          local.lookup_regex,
          tostring(
            # Lookup field in item object
            lookup(
              item,
              var.lookup_field,
              null
            )
          )
        )
      )
    )
  }
}

##############################################################################