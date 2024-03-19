class Company {
  final String name;
  final String bgColor;
  final String fontColor;

  Company({
    required this.name,
    required this.bgColor,
    required this.fontColor,
  });
}

class Tag {
  final String name;
  final String position;
  final String logo;
  final Company company;

  Tag({
    required this.name,
    required this.position,
    required this.logo,
    required this.company,
  });
}

// Dummy data for testing
List<Tag> tags = [
  Tag(
    name: "John Niyontwali",
    position: "Data Analyst",
    logo: "assets/home/mtn.png",
    company: Company(
      name: 'MTN',
      bgColor: "#f8c002",
      fontColor: "#000000",
    ),
  ),
  Tag(
    name: "John Niyontwali",
    position: "Fullstack Developer",
    logo: "assets/home/rwandair.png",
    company: Company(
      name: 'RwandAir',
      bgColor: "#efefef",
      fontColor: "#000000",
    ),
  ),

  Tag(
    name: "John Niyontwali",
    position: "Civil Engineer",
    logo: "assets/home/inyange.png",
    company: Company(
      name: 'Inyange',
      bgColor: "#ffffff",
      fontColor: "#000000",
    ),
  ),
  // Add more items as needed
];
