import 'package:dot_mobile_test/architectures/data/datasources/remote/gallery_remote_data_source.dart';
import 'package:dot_mobile_test/architectures/domain/entities/Gallery.dart';
import 'package:dot_mobile_test/architectures/domain/repositories/GalleryRepository.dart';

/// `DataProductCategoryRepository` is the implementation of `ProductCategoryRepository` present
/// in the Domain layer. It communicates with the server, making API calls to register, login, logout, and
/// store a `User`.
class DataGalleryRepository implements GalleryRepository {
  Future<List<Gallery>> galleryList() async {
    final GalleryList = await GalleryRemoteDataSource.galleryList();
    return GalleryList;
  }
}
