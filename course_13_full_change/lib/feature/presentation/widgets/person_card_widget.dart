import 'package:flutter/material.dart';
import 'package:course_13_full/common/app_colors.dart';
import 'package:course_13_full/feature/domain/entities/person_entity.dart';
import 'package:course_13_full/feature/presentation/pages/person_detail_screen.dart';
import 'package:course_13_full/feature/presentation/widgets/person_cache_image_widget.dart';

class PersonCard extends StatelessWidget {
  final PersonEntity person;

  const PersonCard({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    final statusColor = person.status == 'Alive' ? AppColors.accent : Colors.redAccent;
    return Material(
      color: AppColors.cellBackground,
      borderRadius: BorderRadius.circular(18),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => PersonDetailPage(person: person)),
        ),
        child: Row(
          children: [
            PersonCacheImage(width: 124, height: 154, imageUrl: person.image),
            const SizedBox(width: 14),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(person.name, maxLines: 2, overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 17, color: Colors.white, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 7),
                    Row(children: [
                      Container(width: 8, height: 8, decoration: BoxDecoration(color: statusColor, shape: BoxShape.circle)),
                      const SizedBox(width: 7),
                      Expanded(child: Text('${person.status} - ${person.species}', maxLines: 1, overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: statusColor, fontSize: 12, fontWeight: FontWeight.w600))),
                    ]),
                    const SizedBox(height: 12),
                    const Text('LAST KNOWN LOCATION', style: TextStyle(color: AppColors.greyColor, fontSize: 9, letterSpacing: .8, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 3),
                    Text(person.location.name, maxLines: 1, overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.white, fontSize: 12)),
                    const SizedBox(height: 9),
                    const Text('ORIGIN', style: TextStyle(color: AppColors.greyColor, fontSize: 9, letterSpacing: .8, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 3),
                    Text(person.origin.name, maxLines: 1, overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.white, fontSize: 12)),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
    );
  }
}
