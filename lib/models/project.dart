class OneOffProjects {
  int projectId;
  String projectName;
  String projectDescription;
  String projectCost;
  String projectIllustration;

  OneOffProjects({
    required this.projectId,
    required this.projectName,
    required this.projectDescription,
    required this.projectCost,
    required this.projectIllustration,
  });
}

List<OneOffProjects> projects = [
  OneOffProjects(
      projectId: 1,
      projectName: 'Graphics Design',
      projectDescription: 'Neque porro quisquam est qui dolorem ipsum quia '
          'dolor sit amet, consectetur, adipisci velit...',
      projectCost: '100',
      projectIllustration: 'https://img.freepik'
          '.com/free-vector/graphic-design-colorful-geometrical-lettering_52683-34588.jpg?size=626&ext=jpg'),
  OneOffProjects(
      projectId: 2,
      projectName: 'Article Writing',
      projectDescription: 'Neque porro quisquam est qui dolorem ipsum quia '
          'dolor sit amet, consectetur, adipisci velit...',
      projectCost: '150',
      projectIllustration:
          'https://i.pinimg.com/736x/15/77/88/1577881389bcddb7850b40a11fe40b00.jpg'),
  OneOffProjects(
      projectId: 3,
      projectName: 'Power-point presentation',
      projectDescription: 'Neque porro quisquam est qui dolorem ipsum quia '
          'dolor sit amet, consectetur, adipisci velit...',
      projectCost: '500',
      projectIllustration:
          'https://learn.g2.com/hubfs/Screen%20Shot%202019-09-24%20at%206.12.23%20PM.png'),
  OneOffProjects(
      projectId: 4,
      projectName: 'Web Design',
      projectDescription: 'Neque porro quisquam est qui dolorem ipsum quia '
          'dolor sit amet, consectetur, adipisci velit...',
      projectCost: '1,000',
      projectIllustration:
          'https://bs-uploads.toptal.io/blackfish-uploads/blog/post/seo/og_image_file/og_image/16075/0717_Brutalist_and_Minimalist_Web_Design_Lina_Social-cbd0996a3f2bef8b9b10b86e0c4fb9e5.png'),
  OneOffProjects(
      projectId: 5,
      projectName: 'Graphics Design Pro',
      projectDescription: 'Neque porro quisquam est qui dolorem ipsum quia '
          'dolor sit amet, consectetur, adipisci velit...',
      projectCost: '100',
      projectIllustration: 'https://img.freepik'
          '.com/free-vector/graphic-design-colorful-geometrical-lettering_52683-34588.jpg?size=626&ext=jpg'),
  OneOffProjects(
      projectId: 6,
      projectName: 'Web Design',
      projectDescription: 'Neque porro quisquam est qui dolorem ipsum quia '
          'dolor sit amet, consectetur, adipisci velit...',
      projectCost: '1,500',
      projectIllustration:
          'https://bs-uploads.toptal.io/blackfish-uploads/blog/post/seo/og_image_file/og_image/16075/0717_Brutalist_and_Minimalist_Web_Design_Lina_Social-cbd0996a3f2bef8b9b10b86e0c4fb9e5.png'),
];
