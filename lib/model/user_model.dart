class UserModel {
  int? _id;
  String? _username;
  String? _email;
  String? _firstName;
  String? _lastName;
  String? _gender;
  String? _image;
  String? _token;

  UserModel(
      {int? id,
        String? username,
        String? email,
        String? firstName,
        String? lastName,
        String? gender,
        String? image,
        String? token}) {
    if (id != null) {
      this._id = id;
    }
    if (username != null) {
      this._username = username;
    }
    if (email != null) {
      this._email = email;
    }
    if (firstName != null) {
      this._firstName = firstName;
    }
    if (lastName != null) {
      this._lastName = lastName;
    }
    if (gender != null) {
      this._gender = gender;
    }
    if (image != null) {
      this._image = image;
    }
    if (token != null) {
      this._token = token;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get username => _username;
  set username(String? username) => _username = username;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get firstName => _firstName;
  set firstName(String? firstName) => _firstName = firstName;
  String? get lastName => _lastName;
  set lastName(String? lastName) => _lastName = lastName;
  String? get gender => _gender;
  set gender(String? gender) => _gender = gender;
  String? get image => _image;
  set image(String? image) => _image = image;
  String? get token => _token;
  set token(String? token) => _token = token;

  UserModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _username = json['username'];
    _email = json['email'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _gender = json['gender'];
    _image = json['image'];
    _token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['username'] = this._username;
    data['email'] = this._email;
    data['firstName'] = this._firstName;
    data['lastName'] = this._lastName;
    data['gender'] = this._gender;
    data['image'] = this._image;
    data['token'] = this._token;
    return data;
  }
}
