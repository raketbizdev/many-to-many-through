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

after adding the table column to the relationship table 

run this to your terminal

```sh
$ rake db:migrate
```
and after finishing the migration

open 
```sh
	app/models/staff.rb
	app/models/client.rb
	app/models/relationship.rb
```
inside the ` app/models/staff.rb `

add this code
```sh
	has_many :relationships
	has_many :clients, :through => :relationships
```
it will be something like this
```sh
class Staff < ActiveRecord::Base
	has_many :relationships
	has_many :clients, :through => :relationships
end
```
and inside the ` app/models/client.rb `
```sh
	has_many :relationships
	has_many :staffs, :through => :relationships
```
it will be something like this
```sh
class Client < ActiveRecord::Base
	has_many :relationships
	has_many :staffs, :through => :relationships
end
```
then inside the ` app/models/relationship.rb ` add
```sh
	belongs_to :staff
	belongs_to :client
```
it should be look like this
```sh
class Relationship < ActiveRecord::Base
	belongs_to :staff
	belongs_to :client
end
```
Next we will configure the view form both the `staff` and `client`

Open 
```sh
	app/views/clients/_form.html.erb
	app/views/staffs/_form.html.erb
```

At this point we are using checkbox to select associations

open `app/views/clients/_form.html.erb`

add this to the form
```sh
<%= hidden_field_tag "client[staff_ids][]", nil %>
<% Staff.all.each do |staff| %>
<%= check_box_tag "client[staff_ids][]", staff.id, @client.staff_ids.include?(staff.id), id: dom_id(staff) %>
<%= label_tag dom_id(staff), staff.full_name %><br>
  <% end %>
```
It will be something like this
```sh
<%= form_for(@client) do |f| %>
  <% if @client.errors.any? %>
    <div id="error_explanation">
      <h2><%= pluralize(@client.errors.count, "error") %> prohibited this client from being saved:</h2>

      <ul>
      <% @client.errors.full_messages.each do |message| %>
        <li><%= message %></li>
      <% end %>
      </ul>
    </div>
  <% end %>

  <div class="field">
    <%= f.label :full_name %><br>
    <%= f.text_field :full_name %>
  </div>
  <div class="field">
    <%= f.label :business_name %><br>
    <%= f.text_field :business_name %>
  </div>
<%= hidden_field_tag "client[staff_ids][]", nil %>
<% Staff.all.each do |staff| %>
<%= check_box_tag "client[staff_ids][]", staff.id, @client.staff_ids.include?(staff.id), id: dom_id(staff) %>
<%= label_tag dom_id(staff), staff.full_name %><br>
  <% end %>
  <br>
  <div class="actions">
    <%= f.submit %>
  </div>
<% end %>
```
Then do it also on staff form

open `app/views/staffs/_form.html.erb`

add this 
```sh
<%= hidden_field_tag "staff[client_ids][]", nil %>
<% Client.all.each do |client| %>
<%= check_box_tag "staff[client_ids][]", client.id, @staff.client_ids.include?(client.id), id: dom_id(client) %>
<%= label_tag dom_id(client), client.full_name %><br>
<% end %>
```

something like this

```sh
<%= form_for(@staff) do |f| %>
  <% if @staff.errors.any? %>
    <div id="error_explanation">
      <h2><%= pluralize(@staff.errors.count, "error") %> prohibited this staff from being saved:</h2>

      <ul>
      <% @staff.errors.full_messages.each do |message| %>
        <li><%= message %></li>
      <% end %>
      </ul>
    </div>
  <% end %>

  <div class="field">
    <%= f.label :full_name %><br>
    <%= f.text_field :full_name %>
  </div>
  <div class="field">
    <%= f.label :position %><br>
    <%= f.text_field :position %>
  </div>

<%= hidden_field_tag "staff[client_ids][]", nil %>
<% Client.all.each do |client| %>
<%= check_box_tag "staff[client_ids][]", client.id, @staff.client_ids.include?(client.id), id: dom_id(client) %>
<%= label_tag dom_id(client), client.full_name %><br>
<% end %>
<br>
  <div class="actions">
    <%= f.submit %>
  </div>
<% end %>
```






































