import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:course_15_3/data/models/character.dart';
import 'package:course_15_3/ui/widgets/character_status.dart';

String _speciesInRussian(String value) {
  const translations = {
    'Human': 'Человек',
    'Alien': 'Инопланетянин',
    'Humanoid': 'Гуманоид',
    'Poopybutthole': 'Пупсик',
    'Mythological Creature': 'Мифическое существо',
    'Animal': 'Животное',
    'Robot': 'Робот',
    'Cronenberg': 'Кроненберг',
    'Disease': 'Болезнь',
    'unknown': 'Неизвестно',
  };
  return translations[value] ?? value;
}

String _genderInRussian(String value) {
  const translations = {
    'Female': 'Женский',
    'Male': 'Мужской',
    'Genderless': 'Бесполый',
    'unknown': 'Неизвестно',
  };
  return translations[value] ?? value;
}

class CustomListTile extends StatelessWidget {
  final Results result;
  const CustomListTile({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: MediaQuery.of(context).size.height / 7,
        color: const Color(0xFF1A302D),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: result.image,
              placeholder: (context, url) => const CircularProgressIndicator(
                color: Color(0xFF7FAFA6),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width / 1.9,
                      child: Text(
                        result.name,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium,
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  CharacterStatus(
                      liveState: result.status == 'Alive'
                          ? LiveState.alive
                          : result.status == 'Dead'
                              ? LiveState.dead
                              : LiveState.unknown),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Row(
                      // Rows for Species and Gender
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          // Species column
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Вид:',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              _speciesInRussian(result.species),
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyMedium,
                            )
                          ],
                        ),
                        Column(
                          // Gender  column
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Пол:',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              _genderInRussian(result.gender),
                              style: Theme.of(context).textTheme.bodyMedium,
                            )
                          ],
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
    );
  }
}
