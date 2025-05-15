import 'package:flutter/material.dart';
import 'package:control_gastos/models/expense.dart';
import 'package:control_gastos/services/database_helper.dart';
import 'package:control_gastos/widgets/expense_card.dart';
import 'package:control_gastos/widgets/empty_transaction_list.dart';
import 'package:control_gastos/screens/add_edit_expense_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:control_gastos/theme/app_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Expense> _expenses = [];
  double _totalExpenses = 0.0;
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;
  String _currency = '\$'; // Default currency

  @override
  void initState() {
    super.initState();
    _loadExpenses();
    _loadCurrency();
  }

  _loadCurrency() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _currency = prefs.getString('currency') ?? '\$';
    });
  }

  _saveCurrency(String newCurrency) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('currency', newCurrency);
    setState(() {
      _currency = newCurrency;
    });
  }

  Future<void> _loadExpenses() async {
    List<Expense> expenses = await _dbHelper.getAllExpenses();
    setState(() {
      _expenses = expenses;
      _updateTotalExpenses();
    });
  }

  void _updateTotalExpenses() async {
    double total = await _dbHelper.getTotalExpenses();
    setState(() {
      _totalExpenses = total;
    });
  }

  Future<void> _addOrEditExpense(BuildContext context, {Expense? expense}) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddEditExpenseScreen(expense: expense),
      ),
    );

    if (result != null && result is Expense) {
      if (expense == null) {
        await _dbHelper.insert(result);
      } else {
        result.id = expense.id;
        await _dbHelper.update(result);
      }
      _loadExpenses();
    }
  }

  Future<void> _deleteExpense(int id) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar Eliminación'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('¿Estás seguro que deseas eliminar este gasto?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(foregroundColor: AppTheme.dangerColor),
              child: const Text('Eliminar'),
              onPressed: () async {
                await _dbHelper.delete(id);
                _loadExpenses();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _openSettings(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('Configuración', style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: 'Moneda',
                      border: OutlineInputBorder(),
                    ),
                    value: _currency,
                    items: <String>['\$', '€', '£', '¥', '₡', '₲', 'Bs', 'S/']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        _saveCurrency(newValue);
                        setState(() {}); // Rebuild the bottom sheet
                      }
                    },
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Guardar Configuración'),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Control de Gastos'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => _openSettings(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('Total Gastado este Mes', style: Theme.of(context).textTheme.bodyMedium),
                    const SizedBox(height: 8),
                    Text('$_currency${_totalExpenses.toStringAsFixed(2)}', style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: AppTheme.primaryColor)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: _expenses.isEmpty
                  ? const EmptyTransactionList()
                  : ListView.builder(
                      itemCount: _expenses.length,
                      itemBuilder: (context, index) {
                        final expense = _expenses[index];
                        return ExpenseCard(
                          expense: expense,
                          onEdit: (e) => _addOrEditExpense(context, expense: e),
                          onDelete: _deleteExpense,
                          currency: _currency,
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addOrEditExpense(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}