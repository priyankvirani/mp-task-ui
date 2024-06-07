import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mp_ui/utils/app_textstyle.dart';
import 'package:slide_action/slide_action.dart';

class SlideActionBtn extends StatelessWidget {
  const SlideActionBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideAction(
      trackBuilder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 8,
              ),
            ],
          ),
          child: Center(
            child: Text(
              // Show loading if async operation is being performed
              state.isPerformingAction ? "Loading..." : "Gladkava St., 25",
              style: AppStyle.customTextStyle(),
            ),
          ),
        );
      },
      thumbBuilder: (context, state) {
        return Container(
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            // Show loading indicator if async operation is being performed
            child: state.isPerformingAction
                ? const CupertinoActivityIndicator(
                    color: Colors.white,
                  )
                : const Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                  ),
          ),
        );
      },
      action: () async {
        // Async operation
        await Future.delayed(
          const Duration(seconds: 2),
          () => debugPrint("action completed"),
        );
      },
    );
  }
}
