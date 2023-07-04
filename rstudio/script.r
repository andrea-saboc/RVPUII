library(sparklyr)
library(dplyr)


# Install
spark_install()

# Connect
sc <- sparklyr::spark_connect(master = "local")


datasetPath <- "/data/data.csv"
df <- spark_read_csv(sc, name = "my_data", path = datasetPath, header = TRUE, infer_schema = TRUE)

print(colnames(df))
options(java.parameters = "-Xmx4g")

df.filtered <- df %>% filter(!(is.na(Mk) || is.na(Cn) || is.na(m_kg) || is.na(Mt) || is.na(At1_mm) || is.na(Ft) || is.na(ep_KW) || is.na(Erwltp_gkm) || is.na(W_mm) || is.na(At2_mm))) %>% select( Mk, Cn, m_kg, Mt, At1_mm, At2_mm, W_mm, Ft, Ewltp_gkm, ec_cm3, ep_KW, z_Whkm, Erwltp_gkm, Fuel_consumption)
num_columns <- sparklyr::sdf_ncol(df.filtered)
num_rows <- sparklyr::sdf_nrow(df.filtered)

cat("Number of columns:", num_columns, "\n")
cat("Number of rows:", num_rows, "\n")
print(ncol(sparklyr::sdf_ncol(df.filtered))
print(nrow(sparklyr::sdf_ncol(df.filtered))
df.filtered <- select(df.filtered, Mk, Cn, m_kg, Mt, At1_mm, At2_mm, W_mm, Ft, Ewltp_gkm, ec_cm3, ep_KW, z_Whkm, Erwltp_gkm, Fuel_consumption)



glimpse(df)
head(df)

spark_disconnect(sc)
