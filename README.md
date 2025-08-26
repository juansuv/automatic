# Flujo de Trabajo Git

## Script de Despliegue Manual

### Uso del script `deploy.sh`

```bash
./deploy.sh "mensaje de tu commit"
```

Este script:
- Muestra el estado actual del repositorio
- Te permite revisar los cambios antes de confirmar
- Requiere confirmación manual antes de proceder
- Crea un commit con tu mensaje personalizado
- Sube los cambios al repositorio remoto

### Configurar repositorio remoto

Si aún no tienes un repositorio remoto:

```bash
git remote add origin <URL_DE_TU_REPOSITORIO>
git push -u origin main
```

### Flujo recomendado

1. Hacer cambios en tu código
2. Revisar cambios: `git status` y `git diff`
3. Ejecutar: `./deploy.sh "descripción de los cambios"`
4. Confirmar cuando se solicite

### Alternativas más seguras

En lugar de commits automáticos cada 2 horas, considera:

- **Commits manuales** cuando completes una funcionalidad
- **Branches** para diferentes características
- **Pull requests** para revisión de código
- **CI/CD pipelines** para despliegues automáticos después de pruebas