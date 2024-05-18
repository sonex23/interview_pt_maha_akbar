import 'package:dio/dio.dart';
import 'package:interview_pt_maha_akbar/core/result/result.dart';
import 'package:interview_pt_maha_akbar/features/home/data/api/home_api.dart';
import 'package:interview_pt_maha_akbar/features/home/domain/entity/home_entity.dart';
import 'package:interview_pt_maha_akbar/features/home/domain/entity/post_body.dart';
import 'package:interview_pt_maha_akbar/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeApi client;
  HomeRepositoryImpl(this.client);
  @override
  Future<Result<HomeEntity>> getUserList(int page) async {
    try {
      var entity = await client.getUser(page);
      return Result.data(entity);
    } on DioException catch (e) {
      return Result.error(e.message);
    }
  }

  @override
  Future<Result<bool>> postUser(PostBody body) async {
    try {
      var result = await client.postUser(body);
      return const Result.data(true);
    } on DioException catch (e) {
      return Result.error(e.message);
    }
  }
}
