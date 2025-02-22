# Menggunakan image Maven
FROM maven:3.8.4-openjdk-11

# Menambahkan plugin SonarQube untuk Maven (termasuk JDK)
RUN mvn clean install

# Mengatur working directory di dalam container
WORKDIR /usr/src/app

# Menyalin file kode sumber ke dalam container
COPY . .

# Perintah untuk menjalankan aplikasi (bisa diubah sesuai kebutuhan)
CMD ["mvn", "spring-boot:run"]
