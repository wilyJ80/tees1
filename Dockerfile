# Use a imagem oficial do pgvector
FROM pgvector/pgvector:pg17

# Instalar locales e gerar pt_BR.UTF-8
RUN apt-get update && apt-get install -y locales \
    && echo "pt_BR.UTF-8 UTF-8" > /etc/locale.gen \
    && locale-gen

ENV LANG pt_BR.UTF-8
ENV LANGUAGE pt_BR:pt
ENV LC_ALL pt_BR.UTF-8

# Variáveis de ambiente para o PostgreSQL
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=qualquer_uma
ENV POSTGRES_DB=BD_PESQUISADOR
ENV POSTGRES_HOST_AUTH_METHOD=trust
# Copie o arquivo script de inicialização para o container
COPY init_db.sh /docker-entrypoint-initdb.d/init_db.sh
# Concede permissão de execução ao script de inicialização
RUN chmod +x /docker-entrypoint-initdb.d/init_db.sh
# Expõe a porta 5437
EXPOSE 5437
