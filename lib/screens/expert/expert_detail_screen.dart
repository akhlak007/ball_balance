import 'package:flutter/material.dart';
import '../../models/expert.dart';
import '../../widgets/booking/booking_form.dart';
import '../../widgets/reviews/review_list.dart';

class ExpertDetailScreen extends StatelessWidget {
  final Expert expert;

  const ExpertDetailScreen({super.key, required this.expert});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(expert.name)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ExpertHeader(expert: expert),
            const Divider(),
            BookingForm(expert: expert),
            const Divider(),
            ReviewList(expertId: expert.id),
          ],
        ),
      ),
    );
  }
}

class ExpertHeader extends StatelessWidget {
  final Expert expert;

  const ExpertHeader({super.key, required this.expert});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(expert.imageUrl),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      expert.name,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(expert.expertise),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 16),
                        Text(' ${expert.rating}'),
                        Text(' • ${expert.sessionsCompleted} sessions'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'About',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(expert.bio),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            children: expert.specializations.map((spec) {
              return Chip(label: Text(spec));
            }).toList(),
          ),
        ],
      ),
    );
  }
}