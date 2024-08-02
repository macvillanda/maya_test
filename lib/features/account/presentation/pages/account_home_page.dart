import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:maya_test/constants/constants.dart';
import 'package:maya_test/core/helpers/double_formatter.dart';
import 'package:maya_test/features/account/domain/entities/user_account.dart';
import 'package:maya_test/features/account/domain/repositories/objects_repository.dart';
import 'package:maya_test/features/account/presentation/cubit/account/account.dart';

class AccountHomePage extends StatefulWidget {
  const AccountHomePage({super.key});

  @override
  State<AccountHomePage> createState() => _AccountHomePageState();
}

class _AccountHomePageState extends State<AccountHomePage> {
  ObjectsRepository? repository;
  UserAccount? userAccount;

  final _cubit = AccountCubit();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit
        ..setDependecies(repository, userAccount)
        ..getAll(),
      child: BlocBuilder<AccountCubit, AccountState>(builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            bottomOpacity: 0.0,
            elevation: 0.0,
            scrolledUnderElevation: 0,
            automaticallyImplyLeading: false,
            actions: null,
          ),
          body: _body(context, state),
        );
      }),
    );
  }

  Widget _body(BuildContext context, AccountState state) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                state.isHidden
                    ? "****"
                    : state.currentBalance.currencyFormatted(),
                style: const TextStyle(fontSize: 30),
              ),
              IconButton(
                  onPressed: _cubit.toggleAmountVisibility,
                  color: Colors.black,
                  icon: Icon(
                      state.isHidden ? Icons.visibility : Icons.visibility_off))
            ],
          ),
          SizedBox.fromSize(
            size: const Size.fromHeight(16),
          ),
          ElevatedButton(
            onPressed: () {
              context.push(PageRoutes.sendAmountPage).then(
                  (value) => _cubit.getAll().then((value) => setState(() {})));
            },
            style: ElevatedButton.styleFrom(
                elevation: 12.0,
                textStyle: const TextStyle(color: Colors.white)),
            child: const Text('Send Amount'),
          ),
          SizedBox.fromSize(
            size: const Size.fromHeight(8),
          ),
          ElevatedButton(
            onPressed: () {
              context.push(PageRoutes.transactionPage);
            },
            style: ElevatedButton.styleFrom(
                elevation: 12.0,
                textStyle: const TextStyle(color: Colors.white)),
            child: const Text('Transaction History'),
          ),
          SizedBox.fromSize(
            size: const Size.fromHeight(8),
          ),
          (state.error != null)
              ? Text(state.error?.toString() ?? "")
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
