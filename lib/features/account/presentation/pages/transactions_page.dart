import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maya_test/core/helpers/double_formatter.dart';
import 'package:maya_test/features/account/domain/entities/user_account.dart';
import 'package:maya_test/features/account/presentation/cubit/transactions/transactions.dart';

// ignore: must_be_immutable
class TransactionsPage extends StatelessWidget {
  UserAccount? userAccount;
  TransactionsPage({super.key, this.userAccount});
  final _cubit = TransactionsCubit();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => _cubit
          ..setDependecies(userAccount)
          ..getAll(),
        child: BlocBuilder<TransactionsCubit, TransactionsState>(
            builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              bottomOpacity: 0.0,
              elevation: 0.0,
              scrolledUnderElevation: 0,
              automaticallyImplyLeading: false,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                iconSize: 24.0,
                color: Colors.black,
                onPressed: () => Navigator.pop(context),
              ),
            ),
            body: _body(context, state),
          );
        }));
  }

  Widget _body(BuildContext context, TransactionsState state) {
    if (state.items.isEmpty) {
      return const Center(
        child: Text("No Transactions"),
      );
    }
    return Container(
      margin: const EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: state.items.length,
        itemBuilder: (context, index) {
          final item = state.items[index];
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                Text(item.date),
                const Expanded(
                  child: SizedBox.shrink(),
                ),
                Text(item.amount.currencyFormatted())
              ],
            ),
          );
        },
      ),
    );
  }
}
