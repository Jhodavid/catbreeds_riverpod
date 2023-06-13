import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:catbreeds_riverpod/domain/entities/breed_entity.dart';

import 'package:catbreeds_riverpod/presentation/providers/breeds/breeds_request_state.dart';
import 'package:catbreeds_riverpod/presentation/providers/breeds/breeds_repository_provider.dart';

import 'package:catbreeds_riverpod/presentation/providers/breeds/utils/breeds_request_status_enum.dart';



Future<void> getBreedsData(WidgetRef ref) async {
  setBreedsRequestState(ref ,BreedsRequestStatesEnum.loadingBreeds);

  final breeds = await ref.read(breedsProvider.notifier).getBreeds();

  if(breeds != null) {
    setBreedsRequestState(ref ,BreedsRequestStatesEnum.loadingBreedsImages);

    await ref.read(breedsProvider.notifier).getBreedsImages();
    setBreedsRequestState(ref, BreedsRequestStatesEnum.complete);

  } else {
    setBreedsRequestState(ref ,BreedsRequestStatesEnum.errorInBreeds);
  }

}

void setBreedsRequestState(WidgetRef ref, BreedsRequestStatesEnum state) {
  ref.read(breedsRequestStateProvider.notifier).setRequestState(state);
}


final breedsProvider = StateNotifierProvider<BreedsNotifier, List<BreedEntity>?>((ref) {

  final fetchBreeds = ref.watch(breedsRepositoryProvider).getBreeds;
  final fetchBreedImages = ref.watch(breedsRepositoryProvider).getBreedImages;

  return BreedsNotifier(
    fetchBreeds: fetchBreeds,
    fetchBreedImages: fetchBreedImages
  );

});


typedef BreedsCallback = Future<List<BreedEntity>?> Function();
typedef BreedsImagesCallback = Future<List<String>?> Function(String);

class BreedsNotifier extends StateNotifier<List<BreedEntity>?> {

  BreedsCallback fetchBreeds;
  BreedsImagesCallback fetchBreedImages;
  
  BreedsNotifier({
    required this.fetchBreeds,
    required this.fetchBreedImages
  }) : super([]);


  //For breeds data
  late int countGetImages;
  late int maxCountGetImages;

  Future<List<BreedEntity>?> getBreeds() async {
    final breeds = await fetchBreeds();
    state = breeds;

    return breeds;
  }

  Future<void> getBreedsImages() async {
    countGetImages = 0;
    maxCountGetImages = state!.length;

    final auxBreedList = state;

    for (int i=0; i<state!.length; i++) {
      final auxBreed = state![i];
      final breedImages = await fetchBreedImages(state![i].id);

      auxBreedList![i] = auxBreed.copyWith(
        imagesUrls: breedImages
      );

      state = auxBreedList;
    }
  }
}