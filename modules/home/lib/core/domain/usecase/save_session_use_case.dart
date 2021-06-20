import 'package:common/arch/domain/model/auth.dart';

mixin SaveSession {
  Future<bool> call(SessionData data);
}

class SaveSessionImpl with SaveSession {
  @override
  Future<bool> call(SessionData data) {
    // TODO: implement call
    throw UnimplementedError();
  }

}