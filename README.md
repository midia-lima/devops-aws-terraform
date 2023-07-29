**O que é o Terraform?**

Terraform é uma ferramenta para construir, alterar e criar versões de infraestrutura com segurança e eficiência através de código.

**Principais Características?** 

- Infraestrutura como Código (IaC)
    - Open source e declarativo;
    - Permite versionamento (evolução da infraestrutura e automação);
    - Idempotente (aplicadas várias vezes com o mesmo resultado final);
    - Sintaxe high-level e reusável;
    - Paridade de ambiente;
- Planos de execução
    - Segurança e previsibilidade
    - Separação de planejamento e aplicação
- Híbrido
    - Agnóstico (criar recursos para varios provedores de cloud);
    - Permite deployar para múltiplos provedores simultaneamente;

**Casos de Uso**

- Criar ou provisionar uma nova infraestrutura;
- Gerenciar a infraestrutura existente
- Replicar a infraestrutura

**Como o Terraform funciona?**

- Core do Terraform usa duas fontes de entrada:
    - Seus arquivos de configuração (seu estado desejado);
    - O estado atual, que é gerenciado pelo Terraform.
- Providers: Os provedores expõem recursos, o que possibilita a criação de infraestrutura em todas essas plataformas:
    - IaaS: AWS, GCP, Azure
    - PaaS: Kubernetes, Heroku, Digital Ocean
    - SaaS: New Relic, Datadog

**Para instalar o terraform**
https://developer.hashicorp.com/terraform/downloads

**Principais Comandos**
```shell
terraform -h -> lista de comandos disponíveis
terraform init -> inicia o terraform no diretório atual e faz o downloads dos providers e módulos
terraform plan -> mostra/planeja o que o terraform vai fazer
terraform apply -> aplica uma configuração
terraform destroy -> destroi os recursos criados
terraform validade -> válida se as alterações estão de acordo com as especificações
terraform fmt -> formata o arquivo terraform
terraform -v -> retorna a versão atual do terraform instalado na máquina local
terraform.tfvars -> cria um arquivo com outra forma de declarar variáveis
```

**Como criar o seu primeiro script Terraform**
https://registry.terraform.io/providers/hashicorp/aws/latest/docs

**Documentação Terraform Providers**
https://registry.terraform.io/browse/providers

