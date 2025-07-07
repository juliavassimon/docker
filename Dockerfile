FROM python:3.13.5-alpine3.22 


# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copia o arquivo de dependências para o diretório de trabalho
COPY requirements.txt .

# Instala as dependências do projeto
# --no-cache-dir reduz o tamanho da imagem
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante do código da aplicação para o diretório de trabalho
COPY . .

# Expõe a porta 8000 para que a aplicação possa ser acessada de fora do contêiner
EXPOSE 8000

# Comando para executar a aplicação com Uvicorn
# Usamos --host 0.0.0.0 para tornar a aplicação acessível externamente
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
