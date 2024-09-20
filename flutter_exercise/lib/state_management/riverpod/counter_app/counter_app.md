## 카운터 앱

### 알게된 것들
* Riverpod
  * 개념
    * 상태 관리 오픈 소스 라이브러리다. 
    * 상태 : Flutter에서 상태란 화면상의 정보에 영향을 미치는 변수를 의미한다. 이 상태가 변경되었을 때, 화면을 재구축한다.
    * 상태 관리 : 이러한 상태를 적절히 수정, 삭제, 추가 등 비즈니스 로직을 수행하여 화면에 다시 표시하는 것을 상태 관리라고 한다.

* Notifier
  * 대상이 되는 상태나 수정, 삭제 등의 로직을 관리하는 곳이다. 즉, 상태를 업데이트하거나 상태의 변화를 위젯에 알리는 역할을 한다.
    ```dart
    class CounterNotifier extends StateNotifier<int> {
        CounterNotifier() : super(0);

        void increment() {
            state++;
        }

        void decrement() {
            state--;
        }

        void reset() {
            state = 0;
        }
    }
    ```
* Provider
  * 위젯은 Provider를 사용하여 Notifier의 값을 참조 혹은 업데이트한다.
    ```dart
    final counterProvider = StateNotifierProvider<CounterNotifier, int>((ref) {
        return CounterNotifier();
    });
    ```

* ConsumerWidget
  * Provider의 상태를 구독하여 사용하는 위젯이다.
    ```dart
    @override
    Widget build(BuildContext context, WidgetRef ref) {
        final counter = ref.watch(counterProvider);
        // ...
    }
    ```
    * counter의 상태가 변경되면 ConsumerWidget은 다시 Build되어 화면을 업데이트한다.
