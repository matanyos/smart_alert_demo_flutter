import '../Enums/user_access_level.dart';

class User {
  String? authenticationToken;
  int? userId;
  String? name;
  String? accountName;
  bool? hasDeviceData;
  String? rootGroupId;
  bool? isSupervisor;
  bool? isAdmin;
  bool? canCreateAccount;
  int? registrationStatus;

  User(
      {this.authenticationToken,
      this.userId,
      this.name,
      this.accountName,
      this.hasDeviceData,
      this.rootGroupId,
      this.isSupervisor,
      this.isAdmin,
      this.canCreateAccount,
      this.registrationStatus});
  User.fromJson(Map<String, dynamic> json) {
    authenticationToken = json['authenticationToken'];
    userId = json['userId'];
    name = json['name'];
    accountName = json['accountName'];
    hasDeviceData = json['hasDeviceData'];
    rootGroupId = json['rootGroupId'];
    isSupervisor = json['isSupervisor'];
    isAdmin = json['isAdmin'];
    canCreateAccount = json['canCreateAccount'];
    registrationStatus = json['registrationStatus'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['authenticationToken'] = authenticationToken;
    data['userId'] = userId;
    data['name'] = name;
    data['accountName'] = accountName;
    data['hasDeviceData'] = hasDeviceData;
    data['rootGroupId'] = rootGroupId;
    data['isSupervisor'] = isSupervisor;
    data['isAdmin'] = isAdmin;
    data['canCreateAccount'] = canCreateAccount;
    data['registrationStatus'] = registrationStatus;
    return data;
  }

  static UserAccessLevel getAccessLevel(user) {
    if (user.isAdmin) {
      return UserAccessLevel.admin;
    } else if (user.isSupervisor) {
      return UserAccessLevel.manager;
    } else {
      return UserAccessLevel.user;
    }
  }
}
