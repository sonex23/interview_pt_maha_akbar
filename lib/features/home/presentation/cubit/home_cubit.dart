import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:interview_pt_maha_akbar/core/di/service_locator.dart';
import 'package:interview_pt_maha_akbar/core/result/result.dart';
import 'package:interview_pt_maha_akbar/features/home/data/repository/home_repository_impl.dart';
import 'package:interview_pt_maha_akbar/features/home/domain/entity/home_entity.dart';
import 'package:interview_pt_maha_akbar/features/home/domain/entity/post_body.dart';

part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState.initial());
  List<Datum> listUser = [];
  void getUserList(int page) async {
    emit(HomeState.loading());
    try {
      Result result = await serviceLocator<HomeRepositoryImpl>().getUserList(page);
      if (result is ResponseSuccess) {
        emit(HomeState.loaded(result.data));
        HomeEntity entity = result.data;
        listUser.addAll(entity.data ?? []);
      } else if (result is ResponseError) {
        emit(HomeState.error(result.error ?? "error"));
      }
    } catch (e) {
      emit(HomeState.error(e.toString()));
    }
  }

  void postUser(PostBody body) async {
    emit(HomeState.loading());
    try {
      Result result = await serviceLocator<HomeRepositoryImpl>().postUser(body);
      if (result is ResponseSuccess) {
        emit(const HomeState.posted(true));
      } else if (result is ResponseError) {
        emit(HomeState.error(result.error ?? "error"));
      }
    } catch (e) {
      emit(HomeState.error(e.toString()));
    }
  }
}

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _InitialState;
  const factory HomeState.loading() = _LoadingState;
  const factory HomeState.loaded(HomeEntity user) = _LoadedState;
  const factory HomeState.posted(bool success) = _PostedState;
  const factory HomeState.error(String error) = _ErrorState;
}

extension HomeStateExtension on HomeState {
  bool get isPostedState => this is _PostedState;
  bool get isLoadingState => this is _LoadingState;
  bool get isErrorState => this is _ErrorState;
  bool get isLoadedState => this is _LoadedState;
  String? get errorMessage => mapOrNull(
        error: (value) => value.error,
      );
  HomeEntity? get listUser => mapOrNull(loaded: (value) => value.user);
}
