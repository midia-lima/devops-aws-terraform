## O que é o Terraform?

Terraform é uma ferramenta para construir, alterar e criar versões de infraestrutura com segurança e eficiência através de código.

### Principais Características 

- **Infraestrutura como Código (IaC)**
    - Open source e declarativo;
    - Permite versionamento (evolução da infraestrutura e automação);
    - Idempotente (aplicadas várias vezes com o mesmo resultado final);
    - Sintaxe high-level e reusável;
    - Paridade de ambiente;
- **Planos de execução**
    - Segurança e previsibilidade
    - Separação de planejamento e aplicação
- **Híbrido**
    - Agnóstico (criar recursos para varios provedores de cloud);
    - Permite deployar para múltiplos provedores simultaneamente;

### Casos de Uso

- Criar ou provisionar uma nova infraestrutura;
- Gerenciar a infraestrutura existente
- Replicar a infraestrutura

### Como o Terraform funciona?

- Core do Terraform usa duas fontes de entrada:
    - Seus arquivos de configuração (seu estado desejado);
    - O estado atual, que é gerenciado pelo Terraform.
- Providers: Os provedores expõem recursos, o que possibilita a criação de infraestrutura em todas essas plataformas:
    - IaaS: AWS, GCP, Azure
    - PaaS: Kubernetes, Heroku, Digital Ocean
    - SaaS: New Relic, Datadog

### Para instalar o terraform
https://developer.hashicorp.com/terraform/downloads

### Principais Comandos

```
terraform -h       -> lista de comandos disponíveis
terraform init     -> inicia o terraform no diretório atual e faz o downloads dos providers e módulos
terraform plan     -> mostra/planeja o que o terraform vai fazer
terraform apply    -> aplica as configurações
terraform destroy  -> destroi os recursos criados
terraform validade -> válida se as alterações estão de acordo com as especificações
terraform fmt      -> formata o arquivo terraform
terraform -v       -> retorna a versão atual do terraform instalado na máquina local
terraform show     -> lê o arquivo terraform.tfstate e exibe as informações associadas (IP, rede, etc)
```

- O arquivo principal do terraform chamamos de **main.tf**.
- O arquivo **terraform.tfstate** exibe como está o ambiente atual.
- O bloco provider é obrigatório e aponta para qual provedor de cloud vamos usar.
- Podemos ter mais de um provider. 
- As tags serve para marcar/dar nome aos recursos que utilizo.
- Para utilizarmos as dependências entre os recursos utilizamos o argumento depends_on.
- A configuração da infraestrutura pode ser quebrada em mais de um arquivo, ou podemos deixar em um único arquivo.
- Os arquivos de configuração podem ter qualquer nome, desde que utilizem a extensão .tf.
- Se quisermos usar mais de um provedor podemos utilizar o alias para referenciar os recursos.

## Arquivo de Estado **tfstate**

O arquivo **tfstate** é responsável por guardar toda a informação referente à nossa infraestrutura que criamos com terraform dentro da pasta.
Todos os recursos criados dentro da pasta, estarão no arquivo tfstate. Toda vez que o terraform precisa alterar, adicionar o excluir ele vai conferir o arquivo tfstate juntamente com o que temos na AWS para alterar, adicionar ou excluir.

## Output Values (Valores de saída)
De acordo com a documentação os outputs são como o retorno de uma função que ela vai retornar. Podemos usar o output values quando tivermos montando um módulo, quando queremos mostrar alguma coisa na tela (no output do terraform apply) ou quando queremos acessar alguma coisa do remote state.

## Terradorm Import
Comando que importa o recurso da AWS pelo terminal
Exemplo
```
terraform import aws_s3_bucket.bucket nome_do_bucket
```



### Como criar o seu primeiro script Terraform
https://registry.terraform.io/providers/hashicorp/aws/latest/docs

### Documentação Terraform Providers
https://registry.terraform.io/browse/providers

