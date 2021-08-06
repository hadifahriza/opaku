class UserPayment {
  const UserPayment({
    required this.id,
    required this.userId,
    this.paymentType,
    this.provider,
    this.accountNo
  });

  final String id;
  final String userId;
  final String? paymentType;
  final String? provider;
  final String? accountNo;
}