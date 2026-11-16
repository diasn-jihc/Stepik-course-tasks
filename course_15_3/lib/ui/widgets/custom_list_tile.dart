import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:course_15_3/data/models/character.dart';
import 'package:course_15_3/ui/widgets/character_status.dart';

class CustomListTile extends StatelessWidget {
  final Results result;
  const CustomListTile({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height / 7,
        ),
        color: const Color.fromRGBO(86, 86, 86, 0.8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: result.image,
              width: MediaQuery.of(context).size.height / 7,
              height: MediaQuery.of(context).size.height / 7,
              fit: BoxFit.cover,
              placeholder: (context, url) => const CircularProgressIndicator(
                color: Colors.grey,
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        result.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const SizedBox(height: 10),
                    CharacterStatus(
                      liveState: result.status == 'Alive'
                          ? LiveState.alive
                          : result.status == 'Dead'
                              ? LiveState.dead
                              : LiveState.unknown,
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Species:',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  result.species,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style:
                                      Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Gender:',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  result.gender,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style:
                                      Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
