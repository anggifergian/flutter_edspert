import 'package:flutter_edspert/configs/dio_client.dart';
import 'package:flutter_edspert/models/final_project_app/banner.dart';

class BannerService {
  final DioClient dioClient = DioClient();

  Future<List<Banner>?> getEventBannerList() async {
    var path = '/event/list?limit=5';
    var response = await dioClient.dio.get(path);

    if (response.statusCode == 200) {
      return BannerListResponse.fromJson(response.data).data;
    } else {
      throw 'Unable to retrieve banner data';
    }
  }
}
