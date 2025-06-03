import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

class TermsBottomSheet extends StatelessWidget {
  const TermsBottomSheet({super.key});

  static Future<bool?> show(BuildContext parentContext) async {
    return showModalBottomSheet<bool>(
      backgroundColor: Theme.of(parentContext).colorScheme.background,
      context: parentContext,
      useSafeArea: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      isScrollControlled: true,
      builder: (context) {
        return TermsBottomSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _Body();
  }
}

class _Body extends StatefulWidget {
  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      children: [
        Text('''
Terms and Conditions
Effective Date: [Insert Date]
Welcome to VisitUzbekistan, a mobile application and digital platform designed to assist travelers visiting Uzbekistan by offering information, travel tips, and services including tours, accommodations, restaurants, and more.
By accessing or using the VisitUzbekistan app (the “App”), you agree to comply with and be bound by the following Terms and Conditions. If you do not agree with these Terms, please do not use the App.

1. General Information Disclaimer
The content provided in this App is for general informational purposes only. While we strive to ensure that all information is accurate and up to date, VisitUzbekistan makes no guarantees regarding the accuracy, completeness, reliability, or timeliness of any information.
This includes, but is not limited to:
Currency exchange rates

Visa policies and entry requirements

Local laws and customs

Restaurant or hotel availability and quality

Transportation schedules or app availability

Tour content and pricing

Safety and emergency advice

Travel conditions may change frequently. Users are advised to verify all critical information (e.g., visa requirements, medical advice, local regulations, etc.) with relevant government agencies, service providers, or official sources before acting on the information.

2. User Responsibilities
You agree to use this App responsibly and only for its intended purpose. You must not:
Use the app for any unlawful or prohibited purpose

Submit false or misleading information

Infringe on the rights of others

Attempt to reverse-engineer or disrupt the functionality of the App

You are solely responsible for your travel decisions and actions while using the App.

3. Third-Party Services and Links
The App may include links or integrations with third-party websites, apps, tour providers, currency exchanges, eSIM providers, or other services. VisitUzbekistan does not own or control these third-party services and is not responsible for their content, terms, or reliability.
Any interactions or transactions between you and third parties are solely between you and those third parties. We do not endorse, guarantee, or assume responsibility for any services offered by them.

4. Bookings and Payments
When booking tours or other services through the App, you agree to the specific terms set forth by each tour operator or service provider. VisitUzbekistan may act as a facilitator but is not a party to the transaction, unless explicitly stated.
All payments are processed through secure third-party gateways. We are not responsible for payment processing errors, delays, or disputes unless caused by our own system malfunction.

5. Content Ownership
All original content in the App, including but not limited to logos, design, text, images, and features, is the property of VisitUzbekistan or its content partners. You may not reproduce, copy, or distribute any part of the App without written permission.

6. Privacy Policy
Use of this App is also governed by our Privacy Policy, which outlines how we collect, use, and protect user data.

7. Changes to the App or Terms
We may update or modify the App and these Terms at any time without prior notice. It is your responsibility to review the Terms periodically. Continued use of the App after changes constitutes acceptance of those changes.
We may also temporarily or permanently suspend access to the App for maintenance or updates, without liability.

8. Limitation of Liability
VisitUzbekistan is not liable for any direct, indirect, incidental, or consequential damages arising from your use of the App or reliance on any information provided. This includes, but is not limited to:
Missed flights or travel arrangements

Legal issues due to inaccurate visa or customs advice

Lost items or theft

Health-related issues or emergencies

Financial loss from third-party service providers

Use of the App is at your own risk.

9. Governing Law
These Terms shall be governed by and construed in accordance with the laws of [Your Country or Uzbekistan], without regard to its conflict of law provisions.

10. Contact Information
For any questions or concerns regarding these Terms, please contact us at:
VisitUzbekistan Support
 Email: [support@visituzbekistan.app]
 Phone: [+998-XX-XXX-XXXX]
 Website: [https://visituzbekistan.app]

Let me know if you want a Privacy Policy, User Agreement, or Tour Partner Agreement as well.
'''),
        SizedBox(height: 24.h),
      ],
    );
  }
}
