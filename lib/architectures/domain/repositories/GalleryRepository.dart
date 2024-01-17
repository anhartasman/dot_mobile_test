import 'package:dot_mobile_test/architectures/domain/entities/Gallery.dart';

abstract class GalleryRepository {
  Future<List<Gallery>> galleryList();
}
