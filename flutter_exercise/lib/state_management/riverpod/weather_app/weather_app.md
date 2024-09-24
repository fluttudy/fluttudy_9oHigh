## 날씨 앱

### 알게된 것들
* StateNotifier를 초기화 할때, Future를 이용해 생성자에서 원하는 메서드가 종료될 때까지 로딩을 표시하는 방법
    ```dart
    class WeatherNotifier extends StateNotifier<List<Weather>> {
        bool isLoading = true;

        WeatherNotifier() : super([]) {
            Future.microtask(() => setDefaultCities());
        }

        Future<void> fetchWeatherData(String city) async {
            final response = await http.get(Uri.parse(
                "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=11e1a77c6c02fb3daff62f196c500616"));
            if (response.statusCode == 200) {
                final data = jsonDecode(response.body);
                Weather weather = Weather.fromJson(data);
                state = [...state, weather];
            }
        }

        Future<void> setDefaultCities() async {
            for (String city in cities) {
            await fetchWeatherData(city);
            }
            // 위의 모든 디폴트 지역의 날씨들의 데이터가 들어오면 loading을 멈추고 화면에 표시
            // 뷰모델의 역할을 하는듯?
            isLoading = false;
            state = [...state];
        }
        // ...
    }
    ```
* 구독해서 사용할 경우, Notifier의 State에 특정한 원소에 변화가 생기더라도 UI를 다시 그리지 않는다. State 자체가 다시 설정되어야한다.
    ```dart
    removeCity(int index) {
        state.removeAt(index); // 이 작업만으로는 화면이 다시 그려지지 않음
        // 이렇게 재할당을 진행하면 변경된다.
        // 아마도 state의 주소를 참조해서 사용하다보니, state의 원소가 아닌 state가 변경되어야 하는건가 싶음
        state = [
        ...state,
        ];
    }
    ```
* AppBar에 서치바를 넣는 방법
    ```dart
    actions: [
        IconButton(
        icon: const Icon(
            Icons.search,
            size: 30,
        ),
        onPressed: () {
            // showSearch 메서드를 호출하면 Scaffold로 이루어진 검색화면이 등장한다.
            // 이 검색화면을 관리하기 위한 delegate를 구현해 추가하면 된다.
            showSearch(
            context: context,
            delegate: WeatherSearchDelegate(notifier: notifier),
            );
        },
        ),
    ],
    ```
    * SearchDelegate
        ```dart
        class WeatherSearchDelegate extends SearchDelegate {
            final WeatherNotifier notifier;
            WeatherSearchDelegate({required this.notifier});

            // ...

            // 검색화면의 우측 상단을 구성하는 메서드
            // query는 현재 search field에 입력된 text를 말한다.
            @override
            List<Widget>? buildActions(BuildContext context) => [
                    IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () => query.isEmpty ? close(context, null) : query = '',
                    ),
                    // 검색화면에서 나가려면 close를 호출하면 된다.
                ];

            // 검색화면의 좌측 상단을 구성하는 메서드
            @override
            Widget? buildLeading(BuildContext context) {
                return Container(
                    color: const Color.fromARGB(255, 195, 195, 195),
                    child: Center(
                        child: IconButton(
                            icon: const Icon(Icons.arrow_back),
                            onPressed: () => close(context, null),
                        ),
                    ),
                );
            }
            // 검색 이후 결과를 보여주는 화면을 구성하는 메서드
            @override
            Widget buildResults(BuildContext context) {
                return Container(
                color: const Color.fromARGB(255, 195, 195, 195),
                child: FutureBuilder<List<Weather>>(
                   // ...
                );
            }

            // 아무것도 입력하지 않았을 경우의 화면을 구성하는 메서드
            // 기본적인 리스트를 배치할 수도 있고, 가이드라인 문구를 작성할 수도 있을 듯
            @override
            Widget buildSuggestions(BuildContext context) {
                return Container(
                        color: const Color.fromARGB(255, 195, 195, 195),
                        child: const Center(
                            child: Text('도시 이름을 입력하세요.'),
                    ),
                );
            }

            // ...
        }
        ```
* 구현

    ![riverpod_weather_app-ezgif com-resize](https://github.com/user-attachments/assets/1f6b6aae-c013-498a-a8eb-52466b588937)
