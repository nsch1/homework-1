require 'json'

def read_contacts
  contacts_json = File.read("contacts.json")
  return JSON.parse(contacts_json, { symbolize_names: true })
end

def get_name_and_phone(contacts)
  contacts.map {|contact| {contact[:name] => contact[:phone]}}
end

print get_name_and_phone(read_contacts)