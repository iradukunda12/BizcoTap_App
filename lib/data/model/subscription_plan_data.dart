class SubscriptionPlan {
  final String label;
  final String value;
  final String planType;
  final String additionalText;

  SubscriptionPlan({
    required this.label,
    required this.value,
    required this.planType,
    required this.additionalText,
  });
}

List<SubscriptionPlan> planListData = [
  SubscriptionPlan(
    label: 'Monthly Plan',
    value: '10',
    planType: 'monthly',
    additionalText: 'Billed monthly.',
  ),
  SubscriptionPlan(
    label: 'Yearly Plan',
    value: '100',
    planType: 'yearly',
    additionalText: 'Save up to 20% monthly, billed annually.',
  ),
];
