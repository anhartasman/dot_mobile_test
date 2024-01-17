import 'package:dot_mobile_test/architectures/domain/entities/Place.dart';
import 'package:dot_mobile_test/architectures/domain/entities/UserProfile.dart';
import 'package:dot_mobile_test/config/config_url.dart';
import 'package:dot_mobile_test/services/service_api.dart';

class ProfileRemoteDataSource {
  static Future<UserProfile> userProfile() async {
    final apiURL = PROFILE_URL;
    final responsePost = await ServiceAPI.getAPI(
      URL: apiURL,
      query: {},
    );

    final responAPI = responsePost;
    if (responAPI["status_code"] != 200) {
      throw (responAPI["message"].toString());
    }

    List<Place> placeList = [];

    final dataMap = responAPI["data"]!;

    return UserProfile(
      id: dataMap["id"],
      username: dataMap["username"],
      fullname: dataMap["fullname"],
      email: dataMap["email"],
      phone: dataMap["phone"],
      avatar: dataMap["avatar"],
    );
    //end of userProfile
  }
}
