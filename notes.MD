Sinatra app idea

views:
index.erb - shows the whole family (parents and children)

Parent - has many children
       - belongs to family

parents table:
string - username
string - password_digest
string - email
string - Name
integer - child_id


views:
add_child.erb
index.erb - to show overall stats on family


Children - belongs to parent
	 - belongs to family through parent

childrens table:
string - name
date/time - last_fed
integer - total number of feedings

views:
/children/:id
to see stats on each child


Parent can make changes to their entries in the feeding schedule
Parent can add children 
Parent keeps track of which child they are feeding and can edit any feedings that they enter for a child.
