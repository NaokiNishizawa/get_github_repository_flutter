import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:src/viewmodels/repositoriesViewModel.dart';
import 'package:src/widgets/scroll_detector.dart';
import 'package:stack_trace/stack_trace.dart' as stack_trace;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHiveForFlutter();
  await dotenv.load();

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
    final searchTextController = TextEditingController();
    const threshold = 0.7;
    int limit = 10;

    Widget searchTextField() {
      return TextField(
        controller: searchTextController,
        autofocus: true,
        //TextFieldが表示されるときにフォーカスする（キーボードを表示する）
        cursorColor: Colors.white,
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
          viewModel.search(searchTextController.text, limit);
        },
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: [
            searchTextField(),
            response.when(
              data: (repositoriesResponse) {
                if (repositoriesResponse == null) {
                  return const Text('検索した結果、該当のレポジトリはありませんでした。');
                }

                // Listで表示する
                return ScrollDetector(
                  builder: (context, scrollController) => ListView.builder(
                    controller: scrollController,
                    itemCount: repositoriesResponse.nodes.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Text(repositoriesResponse.nodes[index].name),
                        ],
                      );
                    },
                  ),
                  loadNext: (scrollController) {
                    // TODO
                  },
                  threshold: threshold,
                );
              },
              error: (error, stack) {
                return Text(error.toString());
              },
              loading: () => const CircularProgressIndicator(),
            ),
          ],
        ));
  }
}
