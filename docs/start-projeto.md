# 🚀 Iniciando o Projeto

## ✅ Pré-requisitos

Antes de iniciar, certifique-se de que você possui:

- ✅ **Conta AWS ativa:**  
  Necessária para provisionar os recursos via Terraform e executar a aplicação.

- ✅ **Credenciais AWS configuradas:**  
  As credenciais devem possuir permissões adequadas para criar e gerenciar:
  - Lambda Functions
  - API Gateway
  - DynamoDB
  - ECR
  - IAM Roles e Policies
  - CloudWatch
  - S3(buckets)

- ✅ **Python:**  
  Utilizado para rodar e testar a API localmente.

- ✅ **Docker:**  
  Necessário para construir a imagem da aplicação e testar localmente.

- ✅ **Terraform:**  
  Utilizado para validar toda a infraestrutura como código (IaC).

- ✅ **Git:**  
  Para clonar o repositório e versionar suas alterações.

## 📝 Estrutura de Branches e Workflows

```
MASTER - branch principal onde o CI realiza o disparo automaticamente.
```

## 📦 Workflows (.github/workflows/):

**state.yaml**
```
Execução: Manual(Workflow Dispatch) para criação/verificação:
bucket S3 (<AWS_ACCOUNT_ID>-tf-state)
repositório ECR (<REPO_NAME>)
```

**cicd.yaml**
```
Execução: Manual(Workflow Dispatch) e Automatica(push) na branch principal:
docker-build-push: build da imagem Docker e push para ECR
lambda-deploy(approve): atualiza função Lambda para usar a nova imagem
```

**tf-apply.yaml**
```
Execução: Automatica(push) na pasta terraform/** ou Manual(Workflow Dispatch):
Ação: terraform init, fmt, validate, plan e apply
```

**tf-destroy.yaml**
```
Execução: Manual(Workflow Dispatch)
Ação: Destruir toda a infra e deletar ECR/S3.
```

## 🧭 Passo a Passo:

**Clonar o repositório:**
```bash
git clone git@github.com:seu-usuario/seu-repo.git
cd seu-repo
```

**Configurar os segredos no Github:**
```bash
$AWS_ACCESS_KEY_ID
$AWS_SECRET_ACCESS_KEY
```

**Configurar ambiente no Github:**
```
No GitHub, vá em Settings > Environments > New Environments
Crie um ambiente chamado prd e adicione um revisor!
```

**Criar Estado Remoto (bucket S3 + ECR):**
```
No GitHub Actions, vá em Actions > state.yaml > Run workflow
Escolha a branch principal e clique em Run workflow.
```

**Pipeline CI/CD:**
```
No GitHub Actions, vá em Actions > cicd.yaml > Run workflow
Escolha a branch principal e clique em Run workflow.
Lembrando que esse workflow possui trigger automatica de acordo os push enviados para a branch principal.
```

**Deploy de Infraestrutura (Terraform):**
```
No GitHub Actions, vá em Actions > tf-apply.yaml > Run workflow
Escolha a branch principal e clique em Run workflow.
Lembrando que esse workflow possui trigger automatica de acordo os push enviados para a branch principal no diretorio "terraform/**".
```

**Destruir Infraestrutura (Terraform):**
```
No GitHub Actions, vá em Actions > tf-destroy.yaml > Run workflow
Escolha a branch principal e clique em Run workflow.
```