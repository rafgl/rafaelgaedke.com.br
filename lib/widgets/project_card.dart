import 'package:flutter/material.dart';
import 'package:rafaelgaedke/models/project_data.dart';
import 'package:rafaelgaedke/utils/colors.dart';
import 'package:rafaelgaedke/widgets/project_details_dialog.dart';

class ProjectCard extends StatefulWidget {
  final ProjectData project;

  const ProjectCard({
    Key? key,
    required this.project,
  }) : super(key: key);

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool isHovered = false;

  void _showProjectDetails(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: ProjectDetailsDialog(project: widget.project),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width <= 800;

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: () => _showProjectDetails(context),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: isHovered ? (Matrix4.identity()..translate(0, -5, 0)) : Matrix4.identity(),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(isHovered ? 0.1 : 0.05),
                blurRadius: isHovered ? 10 : 5,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.asset(
                      widget.project.imageUrl,
                      height: isMobile ? 150 : 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        debugPrint('Erro ao carregar imagem: $error');
                        return _buildPlaceholder(isMobile);
                      },
                    ),
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 200),
                      opacity: isHovered ? 1.0 : 0.0,
                      child: Container(
                        height: isMobile ? 150 : 200,
                        width: double.infinity,
                        color: Colors.black.withOpacity(0.7),
                        child: Center(
                          child: ElevatedButton(
                            onPressed: () => _showProjectDetails(context),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: MyColors.red,
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(
                                horizontal: isMobile ? 16 : 24,
                                vertical: isMobile ? 8 : 12,
                              ),
                            ),
                            child: const Text('Ver Detalhes'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(isMobile ? 12.0 : 16.0),
                  child: SizedBox(
                    height: isMobile ? 120 : 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title
                        Text(
                          widget.project.title,
                          style: TextStyle(
                            fontSize: isMobile ? 18 : 20,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xff3d4154),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: isMobile ? 6 : 10),

                        // Description
                        Expanded(
                          child: Text(
                            widget.project.description,
                            style: TextStyle(
                              color: const Color(0xff9398a0),
                              fontSize: isMobile ? 13 : 14,
                              height: 1.5,
                            ),
                            maxLines: isMobile ? 2 : 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),

                        // Technologies
                        Wrap(
                          spacing: 6,
                          runSpacing: 6,
                          children: widget.project.technologies
                              .map((tech) => Chip(
                                    label: Text(
                                      tech,
                                      style: TextStyle(fontSize: isMobile ? 10 : 12),
                                    ),
                                    backgroundColor: MyColors.red.withOpacity(0.1),
                                    labelStyle: const TextStyle(color: MyColors.red),
                                    padding: EdgeInsets.zero,
                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    visualDensity: VisualDensity.compact,
                                  ))
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPlaceholder(bool isMobile) {
    return Container(
      height: isMobile ? 150 : 200,
      width: double.infinity,
      color: Colors.grey[200],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.image_not_supported, size: isMobile ? 30 : 40, color: Colors.grey),
          const SizedBox(height: 8),
          Text(
            widget.project.title,
            style: TextStyle(color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}
