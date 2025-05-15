import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:control_gastos/models/expense.dart';
import 'package:control_gastos/theme/app_theme.dart';

class ExpenseCard extends StatelessWidget {
  final Expense expense;
  final Function(Expense) onEdit;
  final Function(int) onDelete;
  final String currency;

  const ExpenseCard({
    super.key,
    required this.expense,
    required this.onEdit,
    required this.onDelete,
    required this.currency,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        expense.description,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppTheme.primaryColor.withOpacity(0.1),
                        ),
                        child: Text(
                          expense.category,
                          style: TextStyle(
                            color: AppTheme.primaryColor,
                            fontSize: Theme.of(context).textTheme.bodySmall!.fontSize,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        DateFormat('dd MMM<ctrl98>').format(expense.date),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  '-$currency${expense.amount.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: AppTheme.dangerColor, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                OutlinedButton.icon(
                  onPressed: () => onEdit(expense),
                  icon: const Icon(Icons.edit, size: 16),
                  label: const Text('Editar'),
                  style: OutlinedButton.styleFrom(foregroundColor: AppTheme.warningColor),
                ),
                const SizedBox(width: 8),
                ElevatedButton.icon(
                  onPressed: () => onDelete(expense.id!),
                  icon: const Icon(Icons.delete, size: 16),
                  label: const Text('Eliminar'),
                  style: ElevatedButton.styleFrom(backgroundColor: AppTheme.dangerColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}