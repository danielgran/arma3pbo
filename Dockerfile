# docker run -v /path/to/your/pbo:/opt/arma3pbo/v -e FOLDER_NAME=your_pbo_folder_name danielgran/arma3pbo
FROM danielgran/debian-base


ARG FOLDER_NAME

WORKDIR /opt/arma3pbo
COPY src/. .

ENV PYTHONPATH=/opt/arma3pbo

CMD ["python3", "arma3pbo/main.py", "build", "-p ./v/${FOLDER_NAME}", "-o ./v/${FOLDER_NAME}.pbo"]