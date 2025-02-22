class StateEntity {
  final DateTime paymentDate;
  final bool massageState;

  StateEntity({
    required this.paymentDate,
    required this.massageState,
  });

  StateEntity.empty()
      : paymentDate = DateTime(0),
        massageState = false;

  StateEntity copyWith({
    DateTime? paymentDate,
    bool? massageState,
  }) {
    return StateEntity(
      paymentDate: paymentDate ?? this.paymentDate,
      massageState: massageState ?? this.massageState,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StateEntity &&
        other.paymentDate == paymentDate &&
        other.massageState == massageState;
  }

  @override
  int get hashCode => paymentDate.hashCode ^ massageState.hashCode;
}
