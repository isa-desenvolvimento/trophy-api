<h1 align="center">
   🏆 Trophy Api
</h1>
<p align="center">🚀 API de troféus desenvolvida em Ruby </p>

### Features

- [x] Signin end-point
- [x] CRUD for entities: User, Monster, Deaths, Collected Coins and Trophy
- [ ] Test Unity

###🏆 Aplicação

Documentado no ![swagger](https://trophy-api.herokuapp.com/api-docs/index.html)

### Pré-requisitos

Antes de começar, você vai precisar ter instalado em sua máquina as seguintes ferramentas:
[Postgresql](https://www.postgresql.org/), [Ruby 2.5.8](https://www.ruby-lang.org/en/news/2020/03/31/ruby-2-5-8-released/), [Rails](https://rubygems.org/gems/rails/versions/6.1.1). 
Além disto é bom ter um editor para trabalhar com o código como [VSCode](https://code.visualstudio.com/)

### 🎲 Rodando o Back

```bash
# Clone este repositório
$ git clone https://github.com/isa-desenvolvimento/trophy-api

# Acesse a pasta config, procure o arquivo database.yml e configure:
# os parametros: username, password para os configurados no seu mysql.

# Acesse a pasta do projeto no terminal/cmd
$ cd trophy-api

# Execute o seguinte comando para instalar as dependências 
$ bundle install

# Execute o seguinte comando para fazer a migração no banco
$ rake db:drop:all
$ rake db:create:all
$ rake db:migrate

# Execute o seguinte comando para fazer o mapeamento dos end-points
$ rails routes

# Execute a aplicação
$ rails s

# O servidor inciará na porta:3000 - acesse <http://localhost:3000/auth/auth>
```
### 🛠 Tecnologias

As seguintes ferramentas foram usadas na construção do projeto:

- [Postgresql](https://www.postgresql.org/)
- [Ruby 2.5.8](https://www.ruby-lang.org/en/news/2020/03/31/ruby-2-5-8-released/)
- [Rails](https://rubygems.org/gems/rails/versions/6.1.1)
