# PI3
Projeto Integrador do 3º Semestre -  Curso de Ciência de Dados para Negócios &lt;&lt;&lt;FATEC VOTORANTIM>>>

---
* **Fluxo Simplificado de Branches (main e staging)**

    * `main`: É a branch de Produção. Considerada sempre estável, ela reflete a versão do seu projeto que está em uso.

    * `staging`: É a branch de Teste. Todas as novas funcionalidades e correções são mescladas e testadas aqui primeiro.


* **Abra um Pull Request (PR) para `main`:** Somente APÓS os testes em staging serem aprovados, abra um Pull Request do GitHub para mesclar a branch staging na main. Este PR será revisado e, uma vez aprovado e com os checks de CI/CD passando, poderá ser mesclado.

---
Se necessário, podemos criar uma nova branch para tratar bugs, então o fluxo pode ficar `correcao` &rarr; `staging` &rarr; `main`.