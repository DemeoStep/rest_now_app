class StateModel {
  final int? paymentTimestamp;
  final bool? massageState;

  StateModel({
    required this.paymentTimestamp,
    required this.massageState,
  });

  Map<String, dynamic> toJson() {
    return {
      'paymentTimestamp': paymentTimestamp,
      'massageState': massageState,
    };
  }

  factory StateModel.fromJson(Map<String, dynamic> json) {
    return StateModel(
      paymentTimestamp: json['paymentTimestamp'],
      massageState: json['massageState'],
    );
  }
}
