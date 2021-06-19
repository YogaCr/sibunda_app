import 'package:core/ui/base/live_data.dart';
import 'package:core/ui/base/async_vm.dart';

class FormBloc extends AsyncVm {

  final List<LiveData<String>> _txtList = [];
  final List<LiveData<bool>> _isValidList = [];

  @override
  // TODO: implement liveDatas
  List<LiveData> get liveDatas => throw UnimplementedError();
}
