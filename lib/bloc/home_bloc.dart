import 'package:common/data/Result.dart';
import 'package:common/data/model/home_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sibunda_app/bloc/event/home_event.dart';
import 'package:sibunda_app/bloc/state/home_state.dart';

import 'package:common/data/repo/home_repo.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ProfileRepo profileRepo;
  final HomeStatusRepo statusRepo;
  final HomeMenuRepo menuRepo;
  final TipsRepo tipsRepo;

  HomeBloc({
    required this.profileRepo,
    required this.statusRepo,
    required this.menuRepo,
    required this.tipsRepo,
  }): super(OnHomeInit());

  Profile? _profile;
  List<HomeStatus>? _statusList;
  List<HomeMenu>? _menuList;
  List<HomeTips>? _tipsList;

  Profile? get profile => _profile;
  List<HomeStatus>? get statusList => _statusList;
  List<HomeMenu>? get menuList => _menuList;
  List<HomeTips>? get tipsList => _tipsList;

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if(event is GetProfileData) {
      final res = await profileRepo.getProfile(event.email);
      if(res is Success<Profile>) {
        _profile = res.data;
        yield OnProfileDataChanged(res);
      }
    } else if(event is GetHomeStatusData) {
      final res = await statusRepo.getHomeStatusList();
      if(res is Success<List<HomeStatus>>) {
        _statusList = res.data;
        yield OnHomeStatusDataChanged(res);
      }
    } else if(event is GetHomeMenuData) {
      final res = await menuRepo.getHomeMenuList();
      if(res is Success<List<HomeMenu>>) {
        _menuList = res.data;
        yield OnHomeMenuDataChanged(res);
      }
    } else if(event is GetHomeTipsData) {
      final res = await tipsRepo.getHomeTipsList();
      if(res is Success<List<HomeTips>>) {
        _tipsList = res.data;
        yield OnHomeTipsDataChanged(res);
      }
    }
  }

}