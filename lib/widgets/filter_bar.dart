import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';

class FilterBar extends StatelessWidget {
  const FilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TaskProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SegmentedButton<String>(
        segments: const [
          ButtonSegment(value: 'All', label: Text('All'), icon: Icon(Icons.list)),
          ButtonSegment(value: 'Pending', label: Text('Pending'), icon: Icon(Icons.hourglass_empty)),
          ButtonSegment(value: 'Completed', label: Text('Done'), icon: Icon(Icons.check_circle_outline)),
        ],
        selected: {provider.currentFilter},
        onSelectionChanged: (Set<String> newSelection) {
          provider.setFilter(newSelection.first);
        },
        showSelectedIcon: false,
      ),
    );
  }
}