# PI3
Projeto Integrador do 3º Semestre -  Curso de Ciência de Dados para Negócios &lt;&lt;&lt;FATEC VOTORANTIM>>>

---
* **Fluxo Simplificado de Branches (main e staging)**

    * `main`: É a branch de Produção. Considerada sempre estável, ela reflete a versão do seu projeto que está em uso.

    * `staging`: É a branch de Teste. Todas as novas funcionalidades e correções são mescladas e testadas aqui primeiro.


* **Abra um Pull Request (PR) para `main`:** Somente APÓS os testes em staging serem aprovados, abra um Pull Request do GitHub para mesclar a branch staging na main. Este PR será revisado e, uma vez aprovado e com os checks de CI/CD passando, poderá ser mesclado.

---
Se necessário, podemos criar uma nova branch para tratar bugs, então o fluxo pode ficar `correcao` &rarr; `staging` &rarr; `main`.

---
#### Guia de Uso do Conventional Commits
Podemos adotar nas mensagens do commit, o padrão do **Conventional Commits**: https://www.conventionalcommits.org/en/v1.0.0/ 



| Tipo  | Descrição | Uso Principal | Exemplo de Commit |
| :--- | :--- | :--- | :--- |
| **`feat`** | Feature (Funcionalidade) | Adiciona uma nova funcionalidade, recurso ou arquivo que não seja uma correção de bug. | `feat(api): Adiciona endpoint para cadastro de usuarios` |
| **`fix`** | Correction (Correção) | Corrige um bug. | `fix(login): Corrige erro que impedia o login de usuarios` |
| **`docs`** | Documentation (Documentação) | Mudanças apenas na documentação (README, manuais, comentários em código, etc.). | `docs: Atualiza documentacao de setup do ambiente` |
| **`style`** | Style (Estilo) | Mudanças que não afetam o significado do código (espaços em branco, formatação, ponto e vírgula, etc.). | `style: Formata arquivo index.js de acordo com padrao` |
| **`refactor`** | Refactor (Refatoração) | Uma mudança no código que não adiciona recurso nem corrige bug (ex: reestruturação interna). | `refactor(auth): Melhora legibilidade da funcao de validacao` |
| **`test`** | Test (Teste) | Adição ou refatoração de testes. | `test(component): Adiciona testes unitarios para footer` |
| **`chore`** | Chore (Tarefa de Rotina) | Mudanças de rotina que não envolvem código de produção (atualizações de pacotes, configurações de *build*). | `chore(deps): Atualiza dependencia do React para v18` |
| **`ci`** | Continuous Integration | Mudanças nos arquivos e scripts de CI/CD (GitHub Actions, Jenkins, etc.). | `ci: Adiciona workflow para deploy automatico em staging` |
| **`perf`** | Performance | Mudanças de código que melhoram a performance. | `perf(cache): Otimiza tempo de resposta da API de busca` |