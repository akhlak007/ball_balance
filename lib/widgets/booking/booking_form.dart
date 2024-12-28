import 'package:flutter/material.dart';
import '../../models/expert.dart';
import '../../services/booking_service.dart';
import '../../services/payment_service.dart';

class BookingForm extends StatefulWidget {
  final Expert expert;

  const BookingForm({super.key, required this.expert});

  @override
  State<BookingForm> createState() => _BookingFormState();
}

class _BookingFormState extends State<BookingForm> {
  DateTime? selectedDate;
  int selectedDuration = 30;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Book a Session',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          ListTile(
            title: const Text('Select Date & Time'),
            subtitle: Text(selectedDate?.toString() ?? 'Not selected'),
            trailing: const Icon(Icons.calendar_today),
            onTap: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(const Duration(days: 30)),
              );
              if (date != null) {
                setState(() => selectedDate = date);
              }
            },
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<int>(
            value: selectedDuration,
            decoration: const InputDecoration(
              labelText: 'Duration',
            ),
            items: [30, 60, 90].map((duration) {
              return DropdownMenuItem(
                value: duration,
                child: Text('$duration minutes'),
              );
            }).toList(),
            onChanged: (value) {
              setState(() => selectedDuration = value!);
            },
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                if (selectedDate != null) {
                  final booking = await BookingService().bookSession(
                    expertId: widget.expert.id,
                    scheduledTime: selectedDate!,
                    durationMinutes: selectedDuration,
                  );
                  
                  final payment = await PaymentService().processPayment(
                    amount: widget.expert.hourlyRate * (selectedDuration / 60),
                    currency: 'BDT',
                    sessionId: booking.id,
                  );

                  if (payment) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Booking confirmed!')),
                    );
                  }
                }
              },
              child: const Text('Book Now'),
            ),
          ),
        ],
      ),
    );
  }
}