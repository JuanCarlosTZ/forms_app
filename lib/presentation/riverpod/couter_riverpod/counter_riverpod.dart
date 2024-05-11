import 'package:flutter_riverpod/flutter_riverpod.dart';

const _initCounter = 3;
const _initTransactionCounter = 0;

final counterRiverpod = StateProvider.autoDispose((ref) => _initCounter);
final transactionCounterRiverpod =
    StateProvider.autoDispose((ref) => _initTransactionCounter);

void increasedCounter(WidgetRef ref, int value) {
  ref.watch(counterRiverpod.notifier).update((state) => state + value);
  ref.watch(transactionCounterRiverpod.notifier).update((state) => state + 1);
}
