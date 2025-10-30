import pandas as pd

def preparar_dataframes(df: pd.DataFrame) -> dict:
    """Crea los DataFrames de análisis y los devuelve en un diccionario."""

    sospechosas = (
        df['ip_origen'].value_counts()
          .head(10)
          .reset_index()
          .rename(columns={"index": "IP_Origen", "ip_origen": "Conteo"})
    )

    puertos = (
        df['puerto'].value_counts()
          .head(10)
          .reset_index()
          .rename(columns={"index": "Puerto", "puerto": "Conteo"})
    )

    df['timestamp'] = pd.to_datetime(df['timestamp'], errors='coerce')
    df.dropna(subset=['timestamp'], inplace=True)
    ataques_por_hora = (
        df.groupby(df['timestamp'].dt.hour)
          .size()
          .reset_index(name="Conteo")
          .rename(columns={"timestamp": "Hora"})
    )

    tipos_alerta = ["Port scan", "Brute force SSH", "SQL Injection"]
    alertas_pivot = (
        pd.crosstab(df['puerto'], df['alerta'])
          .reindex(columns=tipos_alerta, fill_value=0)
          .reset_index()
          .rename(columns={'puerto': 'Puerto'})
    )

    alertas_global = (
        df['alerta']
          .value_counts()
          .reset_index()
          .rename(columns={"index": "Tipo de alerta", "alerta": "Conteo"})
    )

    ips_destino = (
        df['ip_destino'].value_counts()
          .head(10)
          .reset_index()
          .rename(columns={"index": "IP_Destino", "ip_destino": "Conteo"})
    )

    
    protocolos_usados = (
        df['protocolo'].value_counts()
          .reset_index()
          .rename(columns={"index": "Protocolo", "protocolo": "Conteo"})
    )

    return {
        "IPs sospechosas": sospechosas,
        "IPs destino críticas": ips_destino,
        "Puertos destino": puertos,
        "Protocolos usados": protocolos_usados, 
        "Eventos por hora": ataques_por_hora,
        "Matriz Puerto × Tipo de alerta": alertas_pivot,
        "Alertas mas generadas": alertas_global
    }
