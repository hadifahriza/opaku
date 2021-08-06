class OrderItem {
  OrderItem(
    this.id,
    this.orderId,
    this.productId,
    this.quantity
  );
  
  final String id;
  final String orderId;
  final String productId;
  final int quantity;
}

class OrderDetails {
  OrderDetails(
    this.id,
    this.userId,
    this.total,
    this.paymentId
  );

  final String id;
  final String userId;
  final int total;
  final String paymentId;
}

class PaymentDetails {
  PaymentDetails(
    this.id,
    this.orderId,
    this.amount,
    this.provider,
    this.status
  );

  final String id;
  final String orderId;
  final String amount;
  final String provider;
  final String status;
}