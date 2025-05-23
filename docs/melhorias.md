# ⚙️ Melhorias

## 🌐 Configurar dominio personalizado

**Problema:** 
```
Atualmente, o acesso à API é feito por meio do endpoint padrão do API Gateway da AWS, que possui um endereço genérico e pouco amigável. Isso pode impactar a usabilidade, credibilidade e gestão de segurança da aplicação.
```

## Solução proposta:
```
Configurar um domínio personalizado com alias no Route 53 (ou outro gerenciador de DNS), integrando com o Custom Domain Name do API Gateway.
```

**Benefícios:** 
```
- Segurança aprimorada com suporte a HTTPS/TLS via certificados ACM;
- URL mais amigável e confiável (ex: api.suaempresa.com);
- Melhor monitoramento com ferramentas como CloudWatch + domínios específicos;
```

## 🔒 Implementar AWS WAF para proteção da API

**Problema:** 
```
Atualmente, a API está exposta diretamente ao tráfego externo sem filtros ou políticas de segurança avançadas. Isso aumenta a superfície de ataque, deixando a aplicação vulnerável a ameaças comuns como injeção de SQL, exploração de bots, varreduras automatizadas, entre outros.
```

## Solução proposta:
```
Integrar o AWS WAF (Web Application Firewall) ao API Gateway para aplicar regras gerenciadas e personalizadas que bloqueiem ou limitem tráfego malicioso.
```

**Benefícios:** 
```
- Proteção contra ataques comuns como SQL Injection, XSS, e bots maliciosos;
- Capacidade de bloquear IPs específicos ou países inteiros;
- Regras gerenciadas com atualizações automáticas da AWS ou fornecedores terceiros;
- Monitoramento e logs detalhados via CloudWatch Logs;
- Integração com ACLs e Rate Limiting para prevenir abusos por volume;
- Melhoria significativa na postura de segurança da aplicação.
```

## 🔒 Adicionar autenticação baseada em JWT

**Problema:** 
```
Atualmente a API depende exclusivamente de uma x-api-key, o que limita a granularidade e segurança do controle de acesso.
```

## Solução proposta:
```
Implementar autenticação baseada em JWT (JSON Web Token), onde cada usuário/parceiro autenticado recebe um token assinado contendo claims (informações) sobre permissões, escopo e validade. A verificação do JWT pode ser feita diretamente na aplicação (ex: FastAPI) ou utilizando uma Authorizer Lambda integrada ao API Gateway.

```

**Benefícios:** 
```
- Maior segurança;
- Melhor controle de permissões por usuário/parceiro;
- Pronto para integrações externas seguras;
```

## 📊 Criar alertas para notificação de consumo e oscilações

**Problema:** 
```
Atualmente, não existem alertas configurados para monitorar o consumo da API ou identificar oscilações incomuns no tráfego, ou latência. Isso pode resultar em falta de visibilidade sobre anomalias, falhas críticas ou aumento inesperado de custos.
```

## Solução proposta:
```
Implementar alertas automáticos com base em métricas da AWS (como CloudWatch, Lambda Metrics e API Gateway Metrics), além de configurar notificações via SNS, e-mail ou Slack.
```

**Benefícios:** 
```
- Observabilidade proativa, com identificação de problemas antes de impacto no negócio;
- Notificações em tempo real para times técnicos e/ou gestores;
- Redução de custos ao evitar uso indevido ou excessivo de recursos;
- Automação de respostas a eventos críticos com integração com Lambda, PagerDuty ou Slack;
- Histórico de alertas para análise de padrões e tomada de decisão;
```