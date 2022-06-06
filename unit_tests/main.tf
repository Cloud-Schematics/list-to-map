##############################################################################
# [Unit Test] List to Map if Lookup Value
##############################################################################

module "ut_list_to_map_if_lookup" {
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

locals {
  ut_list_to_map_if_lookup_assert_one_entry_found = lookup(module.ut_list_to_map_if_lookup.value, "test-pass")
}

##############################################################################

##############################################################################
# [Unit Test] List to Map if No Lookup Value
##############################################################################

module "ut_list_to_map_if_no_lookup" {
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

locals {
  ut_list_to_map_if_no_lookup_assert_one_entry_found = lookup(module.ut_list_to_map_if_no_lookup.value, "test-fail")
  ut_list_to_map_if_no_lookup_assert_two_entry_found = lookup(module.ut_list_to_map_if_no_lookup.value, "test-pass")
}

##############################################################################