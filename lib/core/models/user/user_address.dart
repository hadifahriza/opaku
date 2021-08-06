class UserAddress {
  const UserAddress({
    required this.id,
    required this.userId,
    this.address,
    this.city,
    this.postalCode,
    this.country
  });

  final String id;
  final String userId;
  final String? address;
  final String? city;
  final String? postalCode;
  final String? country;
}