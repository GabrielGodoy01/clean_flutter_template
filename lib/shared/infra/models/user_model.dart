import '../../domain/entities/user.dart';
import '../../domain/enums/state_enum.dart';

class UserModel extends User {
  UserModel(
      {required super.name,
      required super.email,
      required super.password,
      required super.state,
      super.id});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        password: json['password'],
        state: StateEnum.values
            .firstWhere((element) => element.name == json['state']));
  }

  static List<UserModel> fromMaps(List array) {
    return array.map((e) => UserModel.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': super.id,
      'name': super.name,
      'email': super.email,
      'password': super.password,
      'state': super.state.name
    };
  }

  factory UserModel.newInstance() {
    return UserModel(
        name: '', email: '', password: '', state: StateEnum.REJECTED);
  }

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    StateEnum? state,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      state: state ?? this.state,
    );
  }
}
