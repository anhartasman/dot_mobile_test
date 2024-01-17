import 'package:dot_mobile_test/architectures/data/datasources/remote/place_remote_data_source.dart';
import 'package:dot_mobile_test/architectures/domain/entities/Place.dart';
import 'package:dot_mobile_test/architectures/domain/repositories/PlaceRepository.dart';

/// `DataProductCategoryRepository` is the implementation of `ProductCategoryRepository` present
/// in the Domain layer. It communicates with the server, making API calls to register, login, logout, and
/// store a `User`.
class DataPlaceRepository implements PlaceRepository {
  Future<List<Place>> placeList() async {
    final placeList = await PlaceRemoteDataSource.placeList();
    return placeList;
  }
}
