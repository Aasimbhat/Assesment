class OnBoard{
  final String image,title,description;

  OnBoard({
    required this.image, 
    required this.title,
     required this.description});
}

final List<OnBoard> demo_data=[
  OnBoard(
    image: "asset/Animation1.json",
    title: "Welcome To Syoft",
    description:  "Transform,Accelrate,Scale", 
    ),
   OnBoard(
    image: "asset/Animation2.json",
    title: "We believe in the change",
    description:  "A change drive by technology and innovation", 
    ),
     OnBoard(
    image: "asset/Animation3.json",
    title: "Improving the lives",
    description:  "To improve businesses with our technology solutions", 
    ),




];