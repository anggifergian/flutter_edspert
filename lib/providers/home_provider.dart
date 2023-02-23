import 'package:flutter/foundation.dart';
import 'package:flutter_edspert/models/final_project_app/banner.dart';
import 'package:flutter_edspert/services/final_project/banner_service.dart';

class HomeProvider with ChangeNotifier {
  bool isLoading = false;
  List<Banner> banners = [];

  getAll() async {
    isLoading = true;
    notifyListeners();

    try {
      var response = await BannerService().getEventBannerList();

      if (response == null) {
        banners = [];
        isLoading = false;
        notifyListeners();
      }

      if (response != null) {
        banners = response;
        isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();
    }
  }
}
