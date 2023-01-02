import 'package:deriv_interview_app/cubits/markets_cubit.dart';
import 'package:deriv_interview_app/cubits/symbol_selector_cubit.dart';
import 'package:deriv_interview_app/models/market.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TickerScreen extends StatelessWidget {
  const TickerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Price Tracker'),
        centerTitle: true,
      ),
      body: BlocBuilder<MarketsCubit, List<Market>>(
        builder: (context, state) {
          while (state.isEmpty) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          return Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Expanded(
                flex: 1,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 20,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton<Market>(
                      isExpanded: true,
                      itemHeight: 80,
                      icon: const Icon(
                        Icons.arrow_drop_down_circle,
                        color: Colors.blue,
                      ),
                      alignment: Alignment.center,
                      hint: const Text(
                        'Select Symbol',
                        textAlign: TextAlign.center,
                      ),
                      underline: Container(
                        height: 2,
                        color: Colors.blue,
                      ),
                      items: state
                          .map((e) => DropdownMenuItem<Market>(
                                value: e,
                                alignment: Alignment.center,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  elevation: 10,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${e.displayName} - ${e.symbol}',
                                          textAlign: TextAlign.start,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ))
                          .toList(),
                      onChanged: (value) {
                        context.read<SymbolSelectorCubit>().select(value);
                      },
                      value: context.read<SymbolSelectorCubit>().state,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              const SizedBox(
                height: 40,
              ),
              const Expanded(
                flex: 8,
                child: SizedBox(),
              ),
            ],
          );
        },
      ),
    );
  }
}
