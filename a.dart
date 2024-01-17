// There is list of user with id as unique field and other user information. There is another list of CONTACT which has user phone number and user id as well. Now you have to assign contact to all the user with relative to their contact id.

// Hint:

void main() {
  List<User> users = [
    User("1", "John"),
    User("2", "Jane"),
    User("3", "Alice"),
  ];
  List<Contact> contacts = [
    Contact("1", "1111111111"),
    Contact("2", "2222222222"),
    Contact("3", "3333333333"),
  ];
  join(users, contacts);
}

void join(List<User> users, List<Contact> contacts) {
  for (User u in users) {
    for (Contact c in contacts) {
      if (u.id == c.id) {
        print("${u.name}: ${c.number}");
        break;
      }
    }
  }
}

class User {
  String id;
  String name;
  User(this.id, this.name);
}

class Contact {
  String id;
  String number;
  Contact(this.id, this.number);
}
