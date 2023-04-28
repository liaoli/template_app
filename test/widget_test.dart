// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:template_app/http/http.dart';

import 'package:template_app/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // // Build our app and trigger a frame.
    // await tester.pumpWidget(const MyApp());
    //
    // // Verify that our counter starts at 0.
    // expect(find.text('0'), findsOneWidget);
    // expect(find.text('1'), findsNothing);
    //
    // // Tap the '+' icon and trigger a frame.
    // await tester.tap(find.byIcon(Icons.add));
    // await tester.pump();
    //
    // // Verify that our counter has incremented.
    // expect(find.text('0'), findsNothing);
    // expect(find.text('1'), findsOneWidget);
    // await testHttp();

    // double rent = 2500;
    // double flower = 1900;
    // double debt = 1000;
    //
    // double result = rent + flower + debt;
    //
    // print("result = $result");
    //
    // double cb = 278943;
    // double zsB = 70898;
    // double ttjj = 72710;
    // double yh = 11897;
    // double bok = 11000 * 0.87;
    // double zjj = 2216;
    // double gio = 0;
    // double pm = 40000;
    //
    // double all = cb + zsB + ttjj + yh + bok + zjj + gio + pm;
    //
    // print("all = $all");
    // print("bok = $bok");
    //
    // print("${30 / 300 * 51 / 100 * 300}");
    // print("${0.05 * 100 / 51 * 300}");

    double account = 50000;

    double lossRate = 0.01;
    double maxLossRate = 0.06;

    double eachLoss = account * lossRate;

    double maxMonthLoss = account * maxLossRate;

    double winRate = 1 / 2;

    double riverWidth = 10;

    double profitLossRatio = 2 / 3;

    double maxNumberOfShare = eachLoss / ((1 - profitLossRatio) * riverWidth);

    int times = 100;

    double numberOfShares = maxNumberOfShare;
    double averagePrice = 40;

    print("每次交易股数： $numberOfShares");
    print("每次亏损最大额度 $eachLoss");
    print("每次交易的最大股数 $maxNumberOfShare");
    print("每月亏损最大额度 $maxMonthLoss");
    print("河宽： $riverWidth");
    print("胜率： $winRate");
    print("止盈比： $profitLossRatio");

    double result =
        (winRate * profitLossRatio - (1 - winRate) * (1 - profitLossRatio)) *
            times *
            riverWidth *
            numberOfShares;

    print("$times次交易盈利： $result");

    print("$times次平均到天： ${times / 20}次/天");
    print("$times次平均到周： ${times / 52}次/周");
    print("$times次平均到月： ${times / 12}次/月");

    print("每次交易均额： ${numberOfShares * averagePrice}");
  });
}
