# terraform-modules

A set of generic Terraform modules

# Using the modules

You can include these modules into your project as described in the [terraform documentataion](https://www.terraform.io/docs/language/modules/sources.html#github)

Here's an example:

```
module "vnet" {
  source = "git@github.com:jessiepuls/terraform_modules.git//azure/vet?ref=main"
}
```

Important things to note in the path above are the double slashes between the repository and the path, and the version to reference. In this example we're just referencing the main branch, but if you'd like to lock to a specific version tag or commit that can be accomplished by including a ref.

# Running Tests

The only requirement to run tests is to have go installed. Once you've done that you can run tests from inside of the test directory with the following command:

```go test ./```

To run tests without cachging (frequently necessary since Terraform chages are outside of your go package structure)

```go test -cout=1 ./```