class User {
  String name;
  String email;
  String password;

  User({
    this.name,
    this.email,
    this.password,
  });

  static User getDefaultUser() {
    return User(name: "Name", email: "email@mail.ru", password: "123456");
  }
}
