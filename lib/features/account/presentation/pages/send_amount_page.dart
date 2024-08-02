import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:maya_test/core/helpers/double_formatter.dart';
import 'package:maya_test/features/account/domain/entities/user_account.dart';
import 'package:maya_test/features/account/domain/repositories/objects_repository.dart';
import 'package:maya_test/features/account/presentation/cubit/send_amount/send_amount.dart';
import 'package:maya_test/features/account/presentation/widgets/error_message.dart';

// ignore: must_be_immutable
class SendAmountPage extends StatelessWidget {
  ObjectsRepository? repository;
  UserAccount? userAccount;
  SendAmountPage({super.key, this.repository, this.userAccount});

  final _cubit = SendAmountCubit();
  final _controller = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => _cubit..setDependecies(repository, userAccount),
        child: BlocConsumer<SendAmountCubit, SendAmountState>(
            listener: (context, state) {
          final stateError = state.error;
          final data = state.sentAmount;
          if (stateError != null && data == null) {
            ErrorMessage.showError(_scaffoldKey, stateError.toString(), () {
              context.pop();
            });
          }
          if (data != null && stateError == null) {
            ErrorMessage.showError(
              _scaffoldKey,
              "You sent ${data.amount.currencyFormatted()}",
              title: "Success",
              () {
                _controller.clear();
                Navigator.pop(context);
              },
            );
          }
        }, builder: (context, state) {
          return Scaffold(
            key: _scaffoldKey,
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

  Widget _body(BuildContext context, SendAmountState state) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    return Center(
        child: Column(
      children: [
        SizedBox.fromSize(
          size: const Size.fromHeight(16),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            controller: _controller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Amount',
              hintText: 'Enter an amount',
            ),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'^\d+(\.\d*)?')),
            ],
          ),
        ),
        SizedBox.fromSize(
          size: const Size.fromHeight(16),
        ),
        ElevatedButton(
          onPressed: () {
            final amountString = _controller.text;
            final amount = double.tryParse(amountString);
            if (amount != null) {
              _cubit.sendAmount(amount);
            } else {
              ErrorMessage.showError(_scaffoldKey, "send amount $amountString",
                  () {
                context.pop();
              });
            }
          },
          style: ElevatedButton.styleFrom(
              elevation: 12.0, textStyle: const TextStyle(color: Colors.white)),
          child: const Text('Send'),
        ),
      ],
    ));
  }
}
