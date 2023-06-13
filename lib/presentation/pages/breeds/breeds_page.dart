import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:catbreeds_riverpod/config/localization/app_localizations.dart';

import 'package:catbreeds_riverpod/domain/entities/breed_entity.dart';

import 'package:catbreeds_riverpod/presentation/pages/breeds/widgets/breeds_app_bar.dart';
import 'package:catbreeds_riverpod/presentation/pages/breeds/widgets/cat_card.dart';
import 'package:catbreeds_riverpod/presentation/providers/breeds/breeds_provider.dart';
import 'package:catbreeds_riverpod/presentation/providers/breeds/breeds_request_state.dart';
import 'package:catbreeds_riverpod/presentation/providers/breeds/utils/breeds_request_status_enum.dart';



class BreedsPage extends ConsumerStatefulWidget {

  const BreedsPage({super.key});

  @override
  ConsumerState<BreedsPage> createState() => _BreedsPageState();
}

class _BreedsPageState extends ConsumerState<BreedsPage> {

  String filterText = '';
  late List<BreedEntity> filteredBreedList;

  @override
  Widget build(BuildContext context) {

    final breeds = ref.watch(breedsProvider);
    final breedsRequestState = ref.watch(breedsRequestStateProvider);

    if(breedsRequestState == BreedsRequestStatesEnum.none || breedsRequestState == BreedsRequestStatesEnum.loadingBreeds) {
      return Scaffold(body: _LoadingBreedsMessage());
    }

    if(breedsRequestState == BreedsRequestStatesEnum.errorInBreeds) {
      return Scaffold(body: _NetworkErrorMessage());
    }

    if(filterText.isEmpty) {
      filteredBreedList = breeds!;
    } else {
      filteredBreedList = breeds!.where(
        (breed) => breed.name.toLowerCase().contains(
          filterText.toLowerCase()
        )
      ).toList();
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Theme.of(context).secondaryHeaderColor,
              systemNavigationBarIconBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark
            ),
            floating: true,
            toolbarHeight: 100,
            flexibleSpace: FlexibleSpaceBar(
              title: BreedsAppBar(
                searchTextValue: filterText,
                onChangeSearch: (searchValue) => setState(() {
                  filterText = searchValue;
                })
              ),
              centerTitle: true,
              titlePadding: const EdgeInsets.all(0),
            ),
            backgroundColor: Colors.transparent,
          ),
          
          SliverList(
            delegate: filteredBreedList.isEmpty ? SliverChildBuilderDelegate(
                (context, index) => _NoResultsMessage(),
                childCount: 1
              ) 
              : SliverChildBuilderDelegate(
                childCount: filteredBreedList.length,
                (_, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 5),
                    child: CatCard(
                      breed: filteredBreedList[index],
                    )
                  );
                },
              )
          )
        ],
      )
    );
  }
}


class _NoResultsMessage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final textStylesTheme = Theme.of(context).textTheme;
    final localeStrings = AppLocalizations.of(context).breedsModule;

    final height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(top: height*0.3),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.info_rounded,
          ),
          const SizedBox(height: 5),
          Text(
            localeStrings.noResult,
            style: textStylesTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}

class _NetworkErrorMessage extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final textStylesTheme = Theme.of(context).textTheme;
    final localeStrings = AppLocalizations.of(context).breedsModule;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.warning_rounded,
            color: Colors.red.withOpacity(0.8),
          ),
          const SizedBox(height: 5),
          SizedBox(
            width: 250,
            child: Text(
              localeStrings.networkError,
              style: textStylesTheme.bodyMedium,
            ),
          ),
          TextButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  localeStrings.refresh,
                  style: textStylesTheme.bodyMedium,
                ),
                const SizedBox(width: 5),
                const Icon(
                  Icons.refresh_rounded
                ),
              ],
            ),
            onPressed: () => getBreedsData(ref),
          )
        ],
      ),
    );
  }
}

class _LoadingBreedsMessage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final textStylesTheme = Theme.of(context).textTheme;
    final localeStrings = AppLocalizations.of(context).breedsModule;
    
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 60,
            width: 60,
            child: Image.asset('assets/images/searching_cat_breeds.gif')
          ),
          Text(
            localeStrings.searchCatBreeds,
            style: textStylesTheme.bodyMedium,
          )
        ],
      ),
    );
  }
}
