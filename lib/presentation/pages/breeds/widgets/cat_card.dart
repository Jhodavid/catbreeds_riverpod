import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';


import 'package:catbreeds_riverpod/config/localization/app_localizations.dart';
import 'package:catbreeds_riverpod/config/router/app_routes.dart';

import 'package:catbreeds_riverpod/domain/entities/breed_entity.dart';

import 'package:catbreeds_riverpod/presentation/widgets/cat_image.dart';



class CatCard extends StatelessWidget {

  final BreedEntity breed;
  
  const CatCard({
    super.key, 
    required this.breed
  });

  @override
  Widget build(BuildContext context) {

    final textStylesTheme = Theme.of(context).textTheme;
    final localeStrings = AppLocalizations.of(context).breedsModule;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        color: Theme.of(context).secondaryHeaderColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5)
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    breed.name,
                    style: textStylesTheme.titleMedium,
                  ),
                ),
                TextButton.icon(
                  icon: const Icon( Icons.read_more_rounded),
                  label: Text(
                    localeStrings.readMore,
                    style: textStylesTheme.bodyMedium,
                  ),
                  onPressed: () => context.push(AppRoutesEnum.detail.path, extra: breed)
                )
              ],
            ),

            CatImagesCarousel(
              height: 240,
              fitImages: BoxFit.fitHeight,
              imageList: breed.imagesUrls,
            ),

            Container(
              height: 40,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5)
                )
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      breed.origin,
                      style: textStylesTheme.titleSmall,
                    ),
                    const Spacer(),
                    Text(
                      localeStrings.intelligence,
                      style: textStylesTheme.titleSmall,
                    ),
                    Tooltip(
                      message: localeStrings.intelligenceTooltipMessage(breed.intelligence),
                      child: Container(
                        height: 35,
                        width: 35,
                        padding: const EdgeInsets.all(7),
                        child: CircularProgressIndicator(
                          strokeWidth: 10,
                          value: breed.intelligence*0.2,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}