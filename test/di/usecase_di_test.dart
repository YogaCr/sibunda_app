import 'package:common/arch/di/usecase_di.dart';
import 'package:common/arch/domain/usecase/auth_usecase.dart';
import 'package:common/arch/domain/usecase/baby_usecase.dart';
import 'package:common/arch/domain/usecase/baby_usecase.dart';
import 'package:common/arch/domain/usecase/data_usecase.dart';
import 'package:common/arch/domain/usecase/firebase_usecase.dart';
import 'package:common/arch/domain/usecase/mother_usecase.dart';
import 'package:common/arch/domain/usecase/profile_usecase.dart';
import 'package:core/domain/model/result.dart';

class UseCaseDiObjDummy extends UseCaseDiObjImpl {
  @override
  IsBabyBorn get isBabyBorn => IsBabyBornDummy();
}

class IsBabyBornDummy with IsBabyBorn {
  @override
  Future<Result<bool>> call(int pregnancyId) async => Success(false);
}