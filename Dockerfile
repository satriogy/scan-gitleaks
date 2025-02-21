# Menggunakan image Maven
FROM maven:3.8.4-openjdk-11

# Menambahkan plugin SonarQube untuk Maven (termasuk JDK)
RUN mvn clean install

# Mengatur working directory di dalam container
WORKDIR /usr/src/app

# Menyalin file kode sumber ke dalam container
COPY . .

# Jalankan build Maven dan SonarQube scanner
RUN mvn sonar:sonar -Dsonar.projectKey=my-project-key -Dsonar.projectName=my-project -Dsonar.projectVersion=1.0 -Dsonar.host.url=http://35.247.151.162:9000

# Perintah untuk menjalankan aplikasi (bisa diubah sesuai kebutuhan)
CMD ["mvn", "spring-boot:run"]
