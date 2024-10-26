import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pay_mobile_web_admin/core/utils/color_constants.dart';
import 'package:pay_mobile_web_admin/core/utils/global_constants.dart';
import 'package:pay_mobile_web_admin/features/transactions/models/transactions_model.dart';
import 'package:pay_mobile_web_admin/features/transactions/widgets/transaction_details_container.dart';

class TransactionDetailsScreen extends StatelessWidget {
  static const String route = "/transaction-details";
  final Transactions transactions;
  const TransactionDetailsScreen({
    Key? key,
    required this.transactions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.parse((transactions.createdAt).toString());
    DateFormat formatDate = DateFormat('dd MMMM yyyy');
    DateFormat formatTime = DateFormat('hh:mm a');
    String formattedDate = formatDate.format(date);
    String formattedTime = formatTime.format(date);
    List<String> getTrnxSummary(transactionData) {
      if (transactionData.trnxType == "Credit") {
        return [
          "From",
          "assets/icons/credit_icon.png",
        ];
      } else if (transactionData.trnxType == "Debit") {
        return [
          "To",
          "assets/icons/debit_icon.png",
        ];
      } else if (transactionData.trnxType == "Wallet Funding") {
        return [
          "Funded To",
          "assets/icons/add_icon.png",
        ];
      } else {
        return ["Hello"];
      }
    }

    return Scaffold(
      // appBar: AppBar(
      //   leadingWidth: screenWidth,
      //   scrolledUnderElevation: 5,
      //   leading: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       const BackButton(),
      //       Text(
      //         "Transaction Details",
      //         style: TextStyle(
      //           fontSize: heightValue25,
      //         ),
      //       ),
      //       Padding(
      //         padding: EdgeInsets.only(right: value10),
      //         child: Container(
      //           height: heightValue50,
      //           width: heightValue50,
      //           decoration: BoxDecoration(
      //               color: const Color(0xFFEBBC2E),
      //               borderRadius: BorderRadius.circular(heightValue10)),
      //           child: const Center(
      //             child: Icon(Icons.share),
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: heightValue10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        //color: scaffoldBackgroundColor,
                      ),
                      child: Center(
                        child: Image.asset(
                          getTrnxSummary(transactions)[1],
                          height: 25,
                          color: transactions.trnxType == "Debit"
                              ? Colors.red
                              : Colors.green,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      transactions.trnxType,
                      style: TextStyle(
                        fontSize: heightValue30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: heightValue20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "On ",
                      style: TextStyle(fontSize: heightValue19),
                    ),
                    Text(
                      formattedDate,
                      style: TextStyle(
                        fontSize: heightValue19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      " at ",
                      style: TextStyle(fontSize: heightValue19),
                    ),
                    Text(
                      formattedTime,
                      style: TextStyle(
                        fontSize: heightValue19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: heightValue15,
                ),
                TransactionDetailsContainer(
                  isAmount: true,
                  label: "Amount",
                  content:
                      "${transactions.trnxType == "Debit" ? "- " : "+ "}LYD${amountFormatter.format(transactions.amount)}",
                  amountColor: transactions.trnxType == "Debit"
                      ? Colors.red
                      : Colors.green,
                ),
                TransactionDetailsContainer(
                  label: getTrnxSummary(transactions)[0],
                  content: transactions.fullNameTransactionEntity,
                ),
                TransactionDetailsContainer(
                  label: "Description",
                  content: transactions.description,
                ),
                TransactionDetailsContainer(
                  label: "Reference",
                  content: transactions.reference,
                ),
                TransactionDetailsContainer(
                  label: "Payment Type",
                  content: transactions.purpose,
                ),
                const TransactionDetailsContainer(
                  label: "Status",
                  content: "Successful",
                  isRow: true,
                ),
                Text(
                  "Any issues or questions?",
                  style: TextStyle(
                    fontSize: heightValue25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: heightValue15,
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.pushNamed(context, CommingSoonScreen.route);
                  },
                  child: Container(
                    height: heightValue80,
                    width: screenWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(heightValue20),
                      color: Colors.red,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/icons/info-circle.png",
                          height: heightValue30,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Reverse Transaction",
                          style: TextStyle(
                            fontSize: heightValue25,
                            color: whiteColor,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: heightValue15,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
