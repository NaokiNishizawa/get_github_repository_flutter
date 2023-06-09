import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:src/viewmodels/repositoriesViewModel.dart';
import 'package:src/widgets/scroll_detector.dart';
import 'package:stack_trace/stack_trace.dart' as stack_trace;
import 'package:url_launcher/url_launcher.dart';

final searchTextController = TextEditingController();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHiveForFlutter();
  await dotenv.load(fileName: "assets/.env");

  FlutterError.demangleStackTrace = (StackTrace stack) {
    if (stack is stack_trace.Trace) {
      return stack.vmTrace;
    }
    if (stack is stack_trace.Chain) {
      return stack.toTrace().vmTrace;
    }
    return stack;
  };

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'GitHub Repository List'),
    );
  }
}

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final response = ref.watch(repositoriesViewModelProvider);
    final viewModel = ref.watch(repositoriesViewModelProvider.notifier);
    const threshold = 0.7;
    bool isLoading = false;

    Widget searchTextField() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: searchTextController,
          autofocus: true,
          //TextFieldが表示されるときにフォーカスする（キーボードを表示する）
          cursorColor: Colors.grey,
          //カーソルの色
          style: const TextStyle(
            //テキストのスタイル
            color: Colors.black,
            fontSize: 20,
          ),
          textInputAction: TextInputAction.search,
          //キーボードのアクションボタンを指定
          decoration: const InputDecoration(
            //TextFiledのスタイル
            enabledBorder: UnderlineInputBorder(
                //デフォルトのTextFieldの枠線
                borderSide: BorderSide(color: Colors.grey)),
            focusedBorder: UnderlineInputBorder(
                //TextFieldにフォーカス時の枠線
                borderSide: BorderSide(color: Colors.grey)),
            hintText: 'Search GitHub', //何も入力してないときに表示されるテキスト
            hintStyle: TextStyle(
              //hintTextのスタイル
              color: Colors.black12,
              fontSize: 20,
            ),
          ),
          onEditingComplete: () {
            viewModel.search(searchTextController.text);
            FocusScope.of(context).unfocus();
          },
        ),
      );
    }

    Future<void> launchRepositoryUrl(String urlStr) async {
      final url = Uri.parse(urlStr);
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          searchTextField(),
          const SizedBox(
            width: double.infinity,
            height: 20,
          ),
          response.when(
            data: (repositoriesResponse) {
              if (repositoriesResponse == null) {
                return const Text('検索文字列を入力してください。');
              }

              if (repositoriesResponse.nodes.isEmpty) {
                return const Text('検索した結果該当のレポジトリはありませんでした。');
              }
              // Listで表示する
              return Expanded(
                child: ScrollDetector(
                  builder: (context, scrollController) => ListView.builder(
                    controller: scrollController,
                    itemCount: repositoriesResponse.nodes.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          launchRepositoryUrl(
                              repositoriesResponse.nodes[index].url);
                        },
                        child: Column(
                          children: [
                            Text(
                              repositoriesResponse.nodes[index].name,
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              repositoriesResponse.nodes[index].url,
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.grey,
                              ),
                            ),
                            const Divider(),
                          ],
                        ),
                      );
                    },
                  ),
                  loadNext: (scrollController) async {
                    // 新しい部分を読み込む
                    if (!isLoading) {
                      isLoading = true;
                      await viewModel.loadNext(searchTextController.text);
                      isLoading = false;
                    }
                  },
                  threshold: threshold,
                ),
              );
            },
            error: (error, stack) {
              return Text(error.toString());
            },
            loading: () => const CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}
