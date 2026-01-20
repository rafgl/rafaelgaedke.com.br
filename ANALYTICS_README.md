# Sistema de Analytics - Captura de Dados de Usuários

Este sistema implementa uma solução completa para captura de dados de usuários que acessam o site, seguindo as melhores práticas de privacidade e conformidade com LGPD/GDPR.

## 🚀 Funcionalidades

### 📊 Captura Automática de Dados
- **Informações do Dispositivo**: Tipo, navegador, sistema operacional
- **Informações da Sessão**: Resolução de tela, idioma, timezone
- **Comportamento do Usuário**: Páginas visitadas, tempo de permanência, interações
- **Dados de Navegação**: Referrer, user agent, localização

### 🔒 Conformidade com LGPD/GDPR
- **Consentimento Explícito**: Dialog de consentimento antes da coleta
- **Armazenamento Local**: Dados ficam no dispositivo do usuário
- **Controle do Usuário**: Possibilidade de revogar consentimento
- **Transparência**: Política de privacidade clara

### 📈 Dashboard de Analytics
- **Estatísticas em Tempo Real**: Visitas, interações, eventos
- **Gráficos e Tabelas**: Visualização dos dados coletados
- **Exportação de Dados**: Download dos dados em JSON
- **Filtros e Relatórios**: Análise por período, tipo de dispositivo, etc.

## 🛠️ Como Usar

### 1. Tracking Automático
O sistema já está configurado para capturar automaticamente:
- Visitas às páginas
- Interações com botões e links
- Tempo de permanência
- Informações do dispositivo

### 2. Tracking Manual
Para adicionar tracking personalizado em seus widgets:

```dart
// Em qualquer controller ou widget
final AnalyticsController analyticsController = Get.find();

// Track de eventos personalizados
analyticsController.trackEvent('custom_event', properties: {
  'custom_property': 'value',
  'user_action': 'button_clicked'
});

// Track de interações específicas
analyticsController.trackButtonClick('meu_botao');
analyticsController.trackLinkClick('https://exemplo.com');
```

### 3. Usando Widgets com Tracking
```dart
// Botão com tracking automático
TrackableButton(
  text: 'Meu Botão',
  trackingName: 'botao_principal',
  onPressed: () {
    // Sua lógica aqui
  },
)

// Link com tracking automático
TrackableLink(
  url: 'https://exemplo.com',
  text: 'Meu Link',
  trackingName: 'link_importante',
)
```

### 4. Usando o Mixin
```dart
class MinhaPage extends StatelessWidget with AnalyticsMixin {
  @override
  Widget build(BuildContext context) {
    // Tracking automático de página
    trackPageView('/minha-pagina');
    
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              trackButtonClick('botao_customizado');
              // Sua lógica aqui
            },
            child: Text('Botão'),
          ),
        ],
      ),
    );
  }
}
```

## 📱 Acessando o Dashboard

1. **Via Interface**: Clique no ícone de analytics na barra superior
2. **Via URL**: Navegue para `/analytics`
3. **Programaticamente**: `Get.toNamed(Routes.analytics)`

## 🔧 Configuração

### Inicialização Automática
O sistema é inicializado automaticamente no `main.dart`:

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Inicialização dos serviços
  await Get.putAsync(() => StorageService().init());
  await Get.putAsync(() => AnalyticsService().onInit());
  Get.put(AnalyticsController());
  
  runApp(const MyApp());
}
```

### Consentimento do Usuário
O dialog de consentimento aparece automaticamente na primeira visita. O usuário pode:
- **Aceitar**: Permite coleta de dados
- **Recusar**: Desabilita tracking
- **Alterar**: Revogar consentimento a qualquer momento

## 📊 Dados Coletados

### Informações Técnicas
- User Agent
- Resolução de tela
- Idioma do navegador
- Timezone
- Tipo de dispositivo (mobile/desktop/tablet)
- Navegador e versão
- Sistema operacional

### Comportamento do Usuário
- Páginas visitadas
- Tempo de permanência
- Interações com elementos
- Cliques em botões e links
- Scroll da página
- Eventos personalizados

### Dados de Sessão
- ID da sessão
- ID da visita
- Timestamp
- Referrer (página de origem)
- Primeira visita ou retorno

## 🔒 Privacidade e Segurança

### Armazenamento Local
- Todos os dados são armazenados localmente no dispositivo
- Nenhum dado é enviado para servidores externos
- Dados ficam no localStorage do navegador

### Controle do Usuário
- Consentimento explícito antes da coleta
- Possibilidade de revogar consentimento
- Exportação dos próprios dados
- Exclusão completa dos dados

### Conformidade Legal
- **LGPD**: Lei Geral de Proteção de Dados (Brasil)
- **GDPR**: General Data Protection Regulation (Europa)
- **Transparência**: Política de privacidade clara
- **Minimização**: Coleta apenas de dados necessários

## 🚀 Funcionalidades Avançadas

### Exportação de Dados
```dart
// Exportar todos os dados coletados
await analyticsController.exportData();
```

### Limpeza de Dados
```dart
// Excluir todos os dados
await analyticsController.clearAllData();
```

### Estatísticas Personalizadas
```dart
// Obter estatísticas por período
final visits = analyticsController.getVisitsByDateRange(
  DateTime.now().subtract(Duration(days: 7)),
  DateTime.now(),
);

// Obter estatísticas por tipo
final buttonClicks = analyticsController.getInteractionsByType('button_click');
```

## 📝 Estrutura dos Arquivos

```
lib/
├── models/
│   ├── user_visit.dart          # Modelo de dados da visita
│   ├── user_interaction.dart    # Modelo de interações
│   └── analytics_data.dart      # Modelo de eventos
├── services/
│   └── analytics_service.dart   # Serviço principal de analytics
├── controllers/
│   └── analytics_controller.dart # Controller para gerenciar dados
├── components/
│   ├── consent_dialog.dart      # Dialog de consentimento
│   ├── trackable_button.dart    # Botão com tracking
│   ├── trackable_link.dart      # Link com tracking
│   └── analytics_initializer.dart # Inicializador automático
├── mixins/
│   └── analytics_mixin.dart     # Mixin para facilitar tracking
└── pages/
    └── analytics_dashboard.dart # Dashboard de visualização
```

## 🎯 Próximos Passos

1. **Integração com APIs**: Enviar dados para serviços externos (opcional)
2. **Relatórios Avançados**: Gráficos mais detalhados
3. **Segmentação**: Análise por grupos de usuários
4. **A/B Testing**: Testes de diferentes versões
5. **Heatmaps**: Visualização de cliques na página

## ⚠️ Considerações Importantes

- **Performance**: O sistema é otimizado para não impactar a performance
- **Privacidade**: Sempre solicite consentimento antes da coleta
- **Transparência**: Seja claro sobre quais dados são coletados
- **Compliance**: Mantenha-se atualizado com as leis de proteção de dados
- **Segurança**: Dados são armazenados localmente, sem transmissão externa

## 🆘 Suporte

Para dúvidas ou problemas:
1. Verifique se todos os serviços estão inicializados
2. Confirme se o usuário deu consentimento
3. Verifique os logs do console para erros
4. Consulte a documentação do GetX para problemas de injeção de dependência
