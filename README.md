# has_many :through

This is a complete sample on how to create many to many association using ` has_many :throght `
for this example i use ` staff ` model and ` client ` model where staff has many client and client has many staff

# Instruction 

```sh
$ rails new many-to-many
$ cd many-to-many
$ bundle install
$ rails server
$ rails generate scaffold Staff full_name:string position:string
$ rails generate scaffold Client full_name:string business_name:string
$ rails generate model relationship
```