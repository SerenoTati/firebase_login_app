class UserModel {
  final String? displayName;
  final String? email;
  final bool emailVerified;
  final bool isAnonymous;
  // final UserMetadata metadata;
  // final String multiFactor;
  final String? phoneNumber;
  final String? photoURL;
  // final List<UserInfo> providerData;
  final String? refreshToken;
  final String? tenantId;
  final String? uid;

  UserModel({
    this.displayName,
    this.email,
    required this.emailVerified,
    required this.isAnonymous,
    // required this.metadata,
    // required this.multiFactor,
    this.phoneNumber,
    this.photoURL,
    // required this.providerData,
    required this.refreshToken,
    required this.tenantId,
    required this.uid,
  });
}

// class UserInfo {}

// class UserMetadata {}
