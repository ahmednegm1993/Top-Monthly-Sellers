import pandas as pd

df = pd.read_excel(r'E:\\Data_analysis_projects\\Top Monthly Sellers\\dataset\\Top Monthly Sellers.xlsx')

df['month'] = pd.to_datetime(df['month'])
df['month'] = df['month'].dt.month

df = df[df['month'] == 1]

df1 = df.groupby(['product_category', 'seller_id'])['total_sales'].sum().reset_index()

df1 = df1.sort_values(['product_category', 'total_sales'], ascending=[True, False])

df_top3 = df1.groupby('product_category').head(3)

print(df_top3)
