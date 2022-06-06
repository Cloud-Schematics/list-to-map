# List To Map

A terraform module to handle simple conversions of a list of objects to a map.

## Module Variables

Name           | Type   | Description                                                                                                                   | Default
-------------- | ------ | ----------------------------------------------------------------------------------------------------------------------------- | -------
list           | list   | List of objects                                                                                                               | 
prefix         | string | Prefix to add to map keys                                                                                                     | null
key_name_field | string | Name of the key inside a list object to be used as the key for the object in the returned output map.                         | name
lookup_field   | string | Name of the field to find with lookup                                                                                         | null
contains       | bool   | Check to see if the object does contain key from `var.lookup_field` if true and does not contain `var.lookup_field` if false. | null

## Module Outputs

`value` - List converted into map

## Example Usage Without Lookup

```terraform
module "list_to_map_if_no_lookup" {
  source = "../"
  list = [
    {
      name = "test-pass"
      test = true
    },
    {
      name = "test-fail"
    }
  ]
}

```

## Example Usage With Lookup

```terraform
##############################################################################
# List to Map if Lookup Value
##############################################################################

module "list_to_map_if_lookup" {
  source       = "../"
  lookup_field = "test"
  contains     = true
  list = [
    {
      name = "test-pass"
      test = true
    },
    {
      name = "test-fail"
    }
  ]
}

##############################################################################
```
