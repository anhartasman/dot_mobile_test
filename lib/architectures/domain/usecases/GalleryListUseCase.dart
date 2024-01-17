import 'dart:async';

import 'package:dot_mobile_test/architectures/domain/entities/Gallery.dart';
import 'package:dot_mobile_test/architectures/domain/repositories/GalleryRepository.dart';
import 'package:dot_mobile_test/architectures/usecase/usecase.dart';

class GalleryListUseCase extends UseCase<List<Gallery>, NoParams> {
  GalleryListUseCase(this.repository);

  final GalleryRepository repository;

  @override
  Future<Stream<List<Gallery>>> call(NoParams params) async {
    final StreamController<List<Gallery>> controller = StreamController();

    try {
      final the_respon = await repository.galleryList();

      controller.add((the_respon));

      controller.close();
    } catch (e) {
      print("add error ${e}");
      // yield (balikanError.balikan(e.toString()));

      controller.addError(e);
    }

    return controller.stream;
  }
}
