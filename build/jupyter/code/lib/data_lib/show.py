from IPython.display import HTML

def show_df(df):
    return HTML(df.to_html())