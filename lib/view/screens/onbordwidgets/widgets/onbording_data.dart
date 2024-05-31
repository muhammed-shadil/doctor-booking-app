class Onboarding {
  String title1;
  String title2;
  String description;
  String image;
  Onboarding({
    required this.title1,
    required this.title2,
    required this.description,
    required this.image,
  });
}

List<Onboarding> onboardingList = [
  Onboarding(
      title1: 'Discover ',
      title2: ' Your Care Team',
      description:
          'Find your perfect match in our network of trusted healthcare professionals. Your journey to better health starts here.',
      image: 'assets/doctorsimage/ttt.jpg'),
  Onboarding(
      title1: 'Effortless ',
      title2: ' Booking, Expert Care',
      description:
          'Book appointments with ease and get the care you need from top-tier doctors without the hassle.',
      image: 'assets/doctorsimage/onboading.jpeg'),
  Onboarding(
      title1: 'Stay on ',
      title2: ' Top of Your Health',
      description:
          'Manage appointments, track medications, and access medical history—all in one place. Take charge of your well-being with Medico.',
      image:
          'assets/doctorsimage/360_F_295518052_aO5d9CqRhPnjlNDTRDjKLZHNftqfsxzI.jpg')
];
