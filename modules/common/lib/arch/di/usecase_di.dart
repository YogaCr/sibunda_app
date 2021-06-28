import 'package:common/arch/di/repo_di.dart';
import 'package:common/arch/domain/usecase/mother_usecase.dart';

class UseCaseDi {
  UseCaseDi._();

  static GetMotherNik get getMotherNik => GetMotherNikImpl(RepoDi.motherRepo);
}