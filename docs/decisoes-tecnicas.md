## Decisões Técnicas

| Item | Descrição | Detalhes |
|------|-----------|----------|
| **1. Linguagem e Framework** | Python + FastAPI | - Alto desempenho e leveza.<br>- Validação automática com Pydantic. |
| **2. Execução via AWS Lambda** | Serverless | - Custos reduzidos.<br>- Alta disponibilidade e escalabilidade automática. |
| **3. Cache com DynamoDB** | Armazenamento de scores | - Evita recálculo.<br>- Alta performance e cobrança sob demanda. |
| **4. Deploy via Docker + Lambda** | Imagem Containerizada | - Consistência entre ambientes.<br>- Facilita testes e deploy. |
| **5. API Gateway com API Key** | Segurança e Controle | - Proteção da API.<br>- Monitoramento e limitação de uso. |
| **6. CI/CD com GitHub Actions** | Entrega Contínua | - Build e push para ECR.<br>- Deploy da Lambda.<br>- Provisionamento com Terraform. |
| **7. Observabilidade com CloudWatch** | Monitoramento | - Logs automáticos.<br>- Pronto para alertas futuros. |
| **8. Arquitetura Resiliente e Segura** | Boas práticas de segurança | - Menor superfície de ataque.<br>- Permissões mínimas.<br>- Monitoramento contínuo. |