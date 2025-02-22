import 'package:rest_now_app/data/model/state_model.dart';
import 'package:rest_now_app/domain/entity/state_entity.dart';

class StateMapper {
  StateEntity fromModel(StateModel model) {
    return StateEntity(
      paymentDate:
          DateTime.fromMillisecondsSinceEpoch(model.paymentTimestamp ?? 0),
      massageState: model.massageState ?? false,
    );
  }

  StateModel toModel(StateEntity entity) {
    return StateModel(
      paymentTimestamp: entity.paymentDate.millisecondsSinceEpoch,
      massageState: entity.massageState,
    );
  }
}
