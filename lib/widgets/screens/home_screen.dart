import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velotask/providers/task_provider.dart';
import 'package:velotask/widgets/empty_state.dart';
import 'package:velotask/widgets/task_card.dart';
import 'package:velotask/widgets/task_form_dialog.dart';

import 'package:velotask/widgets/utils/app_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TaskProvider>(context);
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width > 800;

    return Scaffold(
      body: Row(
        children: [
          if (isDesktop) _buildSidebar(provider),
          Expanded(
            child: Scaffold(
              appBar: AppBar(
                title: const Text("Dashboard"),
                actions: [
                  if (!isDesktop) _buildFilterDropdown(provider),
                  const SizedBox(width: 16),
                ],
              ),
              body: provider.tasks.isEmpty
                  ? const EmptyState()
                  : GridView.builder(
                      padding: const EdgeInsets.all(24),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: width > 1200
                            ? 3
                            : width > 800
                            ? 2
                            : 1,
                        mainAxisExtent: 180,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                      ),
                      itemCount: provider.tasks.length,
                      itemBuilder: (context, index) =>
                          TaskCard(task: provider.tasks[index]),
                    ),
              floatingActionButton: FloatingActionButton.extended(
                backgroundColor: AppTheme.primaryColor,
                foregroundColor: Colors.white,
                onPressed: () => showDialog(
                  context: context,
                  builder: (c) => const TaskFormDialog(),
                ),
                icon: const Icon(Icons.add),
                label: const Text("Create Task"),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSidebar(TaskProvider provider) {
    return Container(
      width: 250,
      color: Colors.white,
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "VeloTask",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w900,
              color: AppTheme.primaryColor,
            ),
          ),
          const SizedBox(height: 40),
          _sidebarItem(
            "All Tasks",
            Icons.grid_view_rounded,
            provider.currentFilter == 'All',
            () => provider.setFilter('All'),
          ),
          // Change this line:
          _sidebarItem(
            "Pending",
            Icons.pending_actions,
            provider.currentFilter == 'Pending',
            () => provider.setFilter('Pending'),
          ),
          _sidebarItem(
            "Completed",
            Icons.check_circle_outline,
            provider.currentFilter == 'Completed',
            () => provider.setFilter('Completed'),
          ),
        ],
      ),
    );
  }

  Widget _sidebarItem(
    String title,
    IconData icon,
    bool isSelected,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected
              ? AppTheme.primaryColor.withOpacity(0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? AppTheme.primaryColor : Colors.grey,
              size: 20,
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: TextStyle(
                color: isSelected
                    ? AppTheme.primaryColor
                    : Colors.grey.shade700,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterDropdown(TaskProvider provider) {
    return PopupMenuButton<String>(
      onSelected: provider.setFilter,
      itemBuilder: (context) => [
        'All',
        'Pending',
        'Completed',
      ].map((f) => PopupMenuItem(value: f, child: Text(f))).toList(),
      icon: const Icon(Icons.filter_list),
    );
  }
}
