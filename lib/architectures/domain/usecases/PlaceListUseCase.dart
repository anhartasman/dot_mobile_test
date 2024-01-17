import 'dart:async';

import 'package:dot_mobile_test/architectures/domain/entities/Place.dart';
import 'package:dot_mobile_test/architectures/domain/repositories/PlaceRepository.dart';
import 'package:dot_mobile_test/architectures/usecase/usecase.dart';

class PlaceListUseCase extends UseCase<List<Place>, NoParams> {
  PlaceListUseCase(this.repository);

  final PlaceRepository repository;

  @override
  Future<Stream<List<Place>>> call(NoParams params) async {
    final StreamController<List<Place>> controller = StreamController();

    try {
      final the_respon = await repository.placeList();

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
