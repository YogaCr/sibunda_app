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
  Profile? get profile => _profile;

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if(event is GetProfileData) {
      final res = await profileRepo.getProfile(event.email);
      if(res is Success<Profile>) {
        _profile = res.data;
        yield OnProfileDataChanged(_profile!);
      }
    }
  }

}