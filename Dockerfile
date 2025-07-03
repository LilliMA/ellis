# Utilize a imagem oficial do Python como base
FROM python:3.13.5-alpine3.22

# Defina o diretório de trabalho
WORKDIR /app

# Copie os arquivos necessários para o diretório de trabalho
COPY requirements.txt .

# Instale as dependências
RUN pip install -r requirements.txt

# Copie o restante dos arquivos para o diretório de trabalho
COPY . .

# Exponha a porta 8000
EXPOSE 8000

# Defina a variável de ambiente para o comando de execução
# ENV COMMAND="uvicorn app:app --reload"
ENV COMMAND="uvicorn app:app --host 0.0.0.0 --reload"

# Defina o comando de execução
CMD ["/bin/sh", "-c", "$COMMAND"]
