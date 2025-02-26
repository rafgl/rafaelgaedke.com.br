import 'package:flutter/material.dart';
import 'package:rafaelgaedke/models/project_data.dart';
import 'package:rafaelgaedke/services/project_service.dart';
import 'package:rafaelgaedke/utils/colors.dart';
import 'package:rafaelgaedke/widgets/project_card.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({Key? key}) : super(key: key);

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  String selectedFilter = 'Todos';
  List<ProjectData> allProjects = [];
  List<ProjectData> filteredProjects = [];
  bool isLoading = true;
  String? error;
  final ProjectService _projectService = ProjectService();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      _loadProjects();
    });
  }

  Future<void> _loadProjects() async {
    try {
      final projects = await _projectService.loadProjects();
      setState(() {
        allProjects = projects;
        filteredProjects = projects;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        error = 'Erro ao carregar projetos: $e';
        isLoading = false;
      });
    }
  }

  // Método para filtrar projetos
  void filterProjects(String filter) {
    setState(() {
      selectedFilter = filter;
      if (filter == 'Todos') {
        filteredProjects = allProjects;
      } else {
        filteredProjects = allProjects.where((project) {
          return project.category == filter || project.technologies.contains(filter);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Definir largura máxima para o conteúdo
          const maxContentWidth = 1400.0;
          final horizontalPadding = constraints.maxWidth > maxContentWidth
              ? (constraints.maxWidth - maxContentWidth) / 2
              : constraints.maxWidth > 1200
                  ? 200.0
                  : 20.0;

          return SingleChildScrollView(
            child: Column(
              children: [
                // Header section with gradient background
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding,
                    vertical: 60,
                  ),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFFF5F7FA), Color(0xFFE4E7EB)],
                    ),
                  ),
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: maxContentWidth),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Meus Projetos',
                          style: TextStyle(
                            fontSize: constraints.maxWidth > 600 ? 42 : 32,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xff3d4154),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Conheça alguns dos meus trabalhos em desenvolvimento Flutter',
                          style: TextStyle(
                            fontSize: constraints.maxWidth > 600 ? 18 : 16,
                            color: const Color(0xff9398a0),
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Projects grid section
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding,
                    vertical: 40,
                  ),
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: maxContentWidth),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Filter chips
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              _buildFilterChip('Todos'),
                              _buildFilterChip('Flutter'),
                              _buildFilterChip('Mobile'),
                              _buildFilterChip('Web'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),

                        // Loading, error ou grid de projetos
                        if (isLoading)
                          const Center(
                            child: Padding(
                              padding: EdgeInsets.all(40.0),
                              child: CircularProgressIndicator(),
                            ),
                          )
                        else if (error != null)
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(40.0),
                              child: Text(
                                error!,
                                style: TextStyle(
                                  color: Colors.red[700],
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          )
                        else
                          _buildProjectsGrid(constraints, maxContentWidth),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    final isSelected = selectedFilter == label;

    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: FilterChip(
        selected: isSelected,
        label: Text(label),
        onSelected: (bool selected) {
          if (selected) {
            filterProjects(label);
          }
        },
        backgroundColor: Colors.white,
        selectedColor: MyColors.red.withOpacity(0.1),
        checkmarkColor: MyColors.red,
        labelStyle: TextStyle(
          color: isSelected ? MyColors.red : const Color(0xff3d4154),
          fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: isSelected ? MyColors.red : Colors.grey.shade300,
          ),
        ),
      ),
    );
  }

  Widget _buildProjectsGrid(BoxConstraints constraints, double maxWidth) {
    // Calculate columns based on screen width
    int crossAxisCount;
    double childAspectRatio;

    if (constraints.maxWidth > 1200) {
      crossAxisCount = 3;
      childAspectRatio = 0.75; // Proporção original para telas grandes
    } else if (constraints.maxWidth > 800) {
      crossAxisCount = 2;
      childAspectRatio = 0.75; // Proporção original para telas médias
    } else {
      crossAxisCount = 1;
      childAspectRatio = 0.95; // Proporção mais compacta para mobile
    }

    // Calculate spacing
    double spacing = constraints.maxWidth > 800 ? 30 : 20;

    // Check if we have projects to display
    if (filteredProjects.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(40.0),
          child: Text(
            'Nenhum projeto encontrado com este filtro.',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xff9398a0),
            ),
          ),
        ),
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: spacing,
        mainAxisSpacing: spacing,
        childAspectRatio: childAspectRatio,
      ),
      itemCount: filteredProjects.length,
      itemBuilder: (context, index) {
        return ProjectCard(project: filteredProjects[index]);
      },
    );
  }
}
