class UserModel {
  String uid;
  String email;
  String firstName;
  String secondName;
  int allSteps;
  double rMin, rKcal, rDist;
  double hMin, hKcal, hDist;

  UserModel(
      {this.uid,
      this.email,
      this.firstName,
      this.secondName,
      this.allSteps,
      this.rMin,
      this.rKcal,
      this.rDist,
      this.hMin,
      this.hKcal,
      this.hDist});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      firstName: map['firstName'],
      secondName: map['secondName'],
      allSteps: map["allSteps"],
      rMin: map["rMin"],
      rKcal: map["rKcal"],
      rDist: map["rDist"],
      hMin: map["hMin"],
      hKcal: map["hKcal"],
      hDist: map["hDist"],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'secondName': secondName,
      'allSteps': allSteps,
      'rMin': rMin,
      'rKcal': rKcal,
      'rDist': rDist,
      'hMin': hMin,
      'hKcal': hKcal,
      'hDist': hDist,
    };
  }
}
