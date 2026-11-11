import 'package:flutter/material.dart';
import 'package:course_13_full/common/app_colors.dart';
import 'package:course_13_full/feature/domain/entities/person_entity.dart';
import 'package:course_13_full/feature/presentation/widgets/person_cache_image_widget.dart';

class PersonDetailPage extends StatelessWidget {
  final PersonEntity person;

  const PersonDetailPage({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    final statusColor = person.status == 'Alive' ? AppColors.alive : Colors.redAccent;
    return Scaffold(
      appBar: AppBar(title: const Text('Character profile', style: TextStyle(fontWeight: FontWeight.w700))),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Center(child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: PersonCacheImage(width: 280, height: 280, imageUrl: person.image),
          )),
          const SizedBox(height: 22),
          Text(person.name, textAlign: TextAlign.center, style: const TextStyle(fontSize: 28, color: AppColors.textPrimary, fontWeight: FontWeight.w800)),
          const SizedBox(height: 10),
          Center(child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(color: AppColors.cellBackground, borderRadius: BorderRadius.circular(30)),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              Container(width: 9, height: 9, decoration: BoxDecoration(color: statusColor, shape: BoxShape.circle)),
              const SizedBox(width: 8),
              Text('${person.status} - ${person.species}', style: TextStyle(color: statusColor, fontWeight: FontWeight.w600)),
            ]),
          )),
          const SizedBox(height: 24),
          const Text('ABOUT', style: TextStyle(color: AppColors.accent, fontSize: 11, letterSpacing: 1.4, fontWeight: FontWeight.w800)),
          const SizedBox(height: 10),
          if (person.type.isNotEmpty) _infoRow('Type', person.type),
          _infoRow('Gender', person.gender),
          _infoRow('Episodes', person.episode.length.toString()),
          _infoRow('Last known location', person.location.name),
          _infoRow('Origin', person.origin.name),
          _infoRow('Created', person.created.toString()),
        ]),
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 9),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
      decoration: BoxDecoration(color: AppColors.cellBackground, borderRadius: BorderRadius.circular(14)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(label, style: const TextStyle(color: AppColors.greyColor, fontSize: 11, fontWeight: FontWeight.w600)),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(color: AppColors.textPrimary, fontSize: 14)),
      ]),
    );
  }
}
