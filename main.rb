require 'json'

def read_contacts
  contacts_json = File.read("contacts.json")
  return JSON.parse(contacts_json, { symbolize_names: true })
end

def get_name_and_phone(contacts)
  contacts.map {|contact| {contact[:name] => contact[:phone]}}
end

def select_contacts_phone(contacts)
  contacts.select {|contact| contact[:phone] =~ /\+1/}
end

def select_contacts_email(contacts)
  contacts.select {|contact| contact[:email] =~ /.org/}
end

def reduce_contacts(contacts)
  contacts.reduce(0) do |sum, contact|
    sum += 1 if contact[:phone] =~ /\+1/ || contact[:email] =~ /.org/
    sum
  end
end

print get_name_and_phone(read_contacts)
puts
puts

print select_contacts_phone(read_contacts)
puts
puts

print select_contacts_email(read_contacts)
puts
puts

print reduce_contacts(read_contacts)
puts