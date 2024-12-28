import 'package:flutter/material.dart';
import '../models/expert.dart';

class ExpertList extends StatelessWidget {
  const ExpertList({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data for demonstration
    final experts = [
      Expert(
        id: '1',
        name: 'Dr. Rahman',
        expertise: 'Business Strategy',
        bio: 'Former CEO with 15 years of experience in startups',
        hourlyRate: 1000,
        imageUrl: 'assets/images/expert1.jpg',
        specializations: ['Startups', 'Business Planning'],
        rating: 4.8,
        sessionsCompleted: 150,
      ),
      Expert(
        id: '2',
        name: 'Sarah Ahmed',
        expertise: 'Technology',
        bio: 'Senior Software Engineer at a leading tech company',
        hourlyRate: 800,
        imageUrl: 'assets/images/expert2.jpg',
        specializations: ['Software Development', 'Career Guidance'],
        rating: 4.9,
        sessionsCompleted: 120,
      ),
    ];

    return ListView.builder(
      itemCount: experts.length,
      itemBuilder: (context, index) {
        final expert = experts[index];
        return ExpertCard(expert: expert);
      },
    );
  }
}

class ExpertCard extends StatelessWidget {
  final Expert expert;

  const ExpertCard({super.key, required this.expert});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(expert.imageUrl),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        expert.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        expert.expertise,
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
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
            const SizedBox(height: 12),
            Text(expert.bio),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: expert.specializations.map((spec) {
                return Chip(
                  label: Text(spec),
                  backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
                );
              }).toList(),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '৳${expert.hourlyRate}/hour',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // TODO: Implement booking logic
                  },
                  child: const Text('Book Session'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}