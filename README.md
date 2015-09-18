# has_many :through

This is a complete sample on how to create many to many association using ` has_many :throght `
for this example i use ` staff ` model and ` client ` model where staff has many client and client has many staff

# Instruction 

In your terminal type below

```sh
$ rails new many-to-many
$ cd many-to-many
$ bundle install
$ rails server
$ rails generate scaffold Staff full_name:string position:string
$ rails generate scaffold Client full_name:string business_name:string
$ rails generate model relationship
```

after typing terminal open ` db/migrate/xxxxxxxxxxxxxx_create_relationships.rb `

add this code
```sh
	t.belongs_to :client, index: true 
	t.belongs_to :staff, index: true
```

```sh
class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      	t.belongs_to :client, index: true 
		t.belongs_to :staff, index: true

      t.timestamps null: false
    end
  end
end
```