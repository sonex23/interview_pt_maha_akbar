import 'package:dio/dio.dart';
import 'package:interview_pt_maha_akbar/features/home/domain/entity/home_entity.dart';
import 'package:interview_pt_maha_akbar/features/home/domain/entity/post_body.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'home_api.g.dart';

@RestApi()
abstract class HomeApi {
  factory HomeApi(Dio dio) = _HomeApi;
  @GET('/users')
  Future<HomeEntity> getUser(@Query('page') int page);

  @POST('/users')
  Future<dynamic> postUser(@Body() PostBody body);
}
