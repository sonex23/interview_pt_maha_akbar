import 'package:interview_pt_maha_akbar/core/result/result.dart';
import 'package:interview_pt_maha_akbar/features/home/domain/entity/home_entity.dart';
import 'package:interview_pt_maha_akbar/features/home/domain/entity/post_body.dart';

abstract class HomeRepository {
  Future<Result<HomeEntity>> getUserList(int page);
  Future<Result<bool>> postUser(PostBody body);
}
