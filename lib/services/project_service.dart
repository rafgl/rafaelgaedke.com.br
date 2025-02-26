import 'dart:convert';
import 'dart:math' show min;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rafaelgaedke/models/project_data.dart';

class ProjectService {
  Future<List<ProjectData>> loadProjects() async {
    try {
      debugPrint('Tentando carregar projetos...');

      // Usando dados embutidos diretamente
      List<ProjectData> fallbackProjects = _getFallbackProjects();

      // Tentativa de carregar do JSON
      try {
        final String response = await rootBundle.loadString('assets/projects.json');
        debugPrint('JSON carregado: ${response.substring(0, min(100, response.length))}...');

        final data = await json.decode(response);
        final List<dynamic> projectsJson = data['projects'];
        final List<ProjectData> loadedProjects = projectsJson.map((json) => _createProjectFromJson(json)).toList();

        if (loadedProjects.isNotEmpty) {
          debugPrint('Projetos carregados do JSON com sucesso: ${loadedProjects.length}');
          return loadedProjects;
        }
      } catch (jsonError) {
        debugPrint('Erro ao carregar do JSON (usando fallback): $jsonError');
      }

      // Se não conseguir carregar do JSON, retorna os projetos de fallback
      return fallbackProjects;
    } catch (e) {
      debugPrint('Erro geral ao carregar projetos: $e');
      rethrow;
    }
  }

  ProjectData _createProjectFromJson(Map<String, dynamic> json) {
    return ProjectData(
      title: json['title'] ?? 'Sem título',
      description: json['description'] ?? 'Sem descrição',
      technologies: json['technologies'] != null ? List<String>.from(json['technologies']) : ['Flutter'],
      imageUrl: json['imageUrl'] ?? 'assets/img/eu.jpg',
      projectUrl: json['projectUrl'] ?? 'https://github.com/rafgl',
      category: json['category'] ?? 'Mobile',
      details: json['details'] ?? 'Detalhes não disponíveis',
      features: json['features'] != null ? List<String>.from(json['features']) : ['Funcionalidade não especificada'],
    );
  }

  List<ProjectData> _getFallbackProjects() {
    return [
      ProjectData(
        title: 'OCPlay',
        description: 'Aplicativo jornal de notícias, com notícias de futebol, política, economia, entretenimento e etc.',
        technologies: ['Flutter', 'Dart', 'GetX'],
        imageUrl: 'assets/img/eu.jpg',
        projectUrl: 'https://github.com/rafgl',
        category: 'Mobile',
        details: 'OCPlay é um aplicativo de jornal digital que oferece notícias atualizadas sobre diversos temas como esportes, política, economia e entretenimento.',
        features: ['Feed de notícias personalizado', 'Notificações em tempo real', 'Modo offline para leitura posterior'],
      ),
      ProjectData(
        title: 'MyMime',
        description: 'Aplicativo para posto de combustível, com sistema de login, cadastro de veículos, abastecimento e histórico.',
        technologies: ['Flutter', 'Dart', 'GetX'],
        imageUrl: 'assets/img/eu.jpg',
        projectUrl: 'https://github.com/rafgl',
        category: 'Mobile',
        details: 'MyMime é um aplicativo completo para postos de combustível que permite aos usuários gerenciar abastecimentos.',
        features: ['Localização de postos próximos', 'Gerenciamento de veículos', 'Histórico de abastecimentos'],
      ),
      ProjectData(
        title: 'NSCTotal',
        description: 'Aplicativo jornal de notícias, com notícias de futebol, política, economia, entretenimento e etc.',
        technologies: ['Flutter', 'Dart', 'GetX'],
        imageUrl: 'assets/img/eu.jpg',
        projectUrl: 'https://github.com/rafgl',
        category: 'Mobile',
        details: 'NSCTotal é uma plataforma de notícias multimídia que integra conteúdo jornalístico com transmissões de rádio ao vivo.',
        features: ['Streaming de rádio ao vivo', 'Podcasts e conteúdo de áudio', 'Notícias categorizadas'],
      ),
      ProjectData(
        title: 'AgroShop',
        description: 'Aplicativo loja de produtos para agricultura, com sistema de login, cadastro de usuários, produtos, carrinho de compras, pagamento e etc.',
        technologies: ['Flutter', 'Dart', 'GetX'],
        imageUrl: 'assets/img/eu.jpg',
        projectUrl: 'https://github.com/rafgl',
        category: 'Mobile',
        details: 'AgroShop é um marketplace especializado em produtos agrícolas que conecta produtores rurais a fornecedores de insumos e equipamentos.',
        features: ['Catálogo de produtos agrícolas', 'Sistema de busca avançada', 'Carrinho de compras'],
      ),
    ];
  }
}
