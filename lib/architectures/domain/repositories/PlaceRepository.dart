import 'package:dot_mobile_test/architectures/domain/entities/Place.dart';

abstract class PlaceRepository {
  Future<List<Place>> placeList();
}
