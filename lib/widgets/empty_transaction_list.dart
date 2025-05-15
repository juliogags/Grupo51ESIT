import 'package:flutter/material.dart';
import 'package:control_gastos/theme/app_theme.dart';

class EmptyTransactionList extends StatelessWidget {
  const EmptyTransactionList({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Icon(
            Icons.receipt_outlined,
            size: 60,
            color: Colors.grey,
          ),
          const SizedBox(height: 16),
          Text(
            'No hay transacciones',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppTheme.grayColor),
          ),
          const SizedBox(height: 8),
          Text(
            'Agrega tu primer gasto haciendo clic en el botón +',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}