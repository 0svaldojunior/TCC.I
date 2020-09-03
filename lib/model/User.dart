class User {
  String _name;
  String _mail;
  String _phone;
  String _password;
  User();

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "name" : this._name,
      "mail" : this._mail,
      "phone" : this._phone,
    };
    return ( map );
  }
  
  String get name => _name;
  set name(String value) {
    _name = value;
  }

  String get mail => _mail;
  set mail(String value) {
    _mail = value;
  }

  String get phone => _phone;
  set phone(String value) {
    _phone = value;
  }

  String get password => _password;
  set password(String value) {
    _password = value;
  }
}