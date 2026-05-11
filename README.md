# Crud_JSP

> Aplicação web desenvolvida em Java com JSP e Servlets, implementando um CRUD completo para praticar o padrão MVC com tecnologias Java para web.

## 🛠️ Tecnologias

![Java](https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white)
![JSP](https://img.shields.io/badge/JSP-007396?style=for-the-badge&logo=java&logoColor=white)
![HTML5](https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white)
![CSS3](https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=css3&logoColor=white)
![Apache Tomcat](https://img.shields.io/badge/Apache_Tomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=black)
![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)

## ⚙️ Funcionalidades

- ✅ Cadastrar produto
- ✅ Listar produtos
- ✅ Editar produto
- ✅ Deletar produto

## ▶️ Como Rodar

### Pré-requisitos

- Java 17+
- Apache Tomcat 9+
- MySQL

### Configuração do banco

```sql
CREATE DATABASE croches;

CREATE TABLE produto (
  codigo INT PRIMARY KEY,
  tipo VARCHAR(100),
  nome VARCHAR(100),
  preco DOUBLE
);
```

### Configuração da conexão

Em `src/dao/ProdutoDAO.java`, ajuste as credenciais se necessário:

```java
return DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/croches", "root", "sua_senha"
);
```

### Deploy no Tomcat

1. Importe o projeto na sua IDE (IntelliJ ou Eclipse).
2. Configure o Tomcat como servidor de execução.
3. Execute o projeto — a aplicação ficará disponível em:

```text
http://localhost:8080/Crud_JSP
```
