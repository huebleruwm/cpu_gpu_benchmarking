import os
import pandas as pd
import plotly.express as px
from dash import Dash, dcc, html, Input, Output, State
import argparse

parser = argparse.ArgumentParser()
parser.add_argument("--folder", required=True, help="Path to folder containing CSV files")
args = parser.parse_args()
DATA_FOLDER = args.folder

# --- Load CSVs ---
def load_all_data():
    data_frames = {}
    for file in os.listdir(DATA_FOLDER):
        if file.endswith(".csv"):
            path = os.path.join(DATA_FOLDER, file)
            df = pd.read_csv(path)
            if "n1" in df.columns and "loop_runtime_seconds" in df.columns:
                df["throughput"] = df["ntasks"] * df["n1"] / df["loop_runtime_seconds"]
                df["batch size"] = df["ntasks"] * df["n1"]
                df["__filename__"] = file
                df["__label__"] = os.path.splitext(file)[0]  # Strip ".csv"
                data_frames[file] = df
    return data_frames

data_frames = load_all_data()
all_files = list(data_frames.keys())

# --- Dash App ---
app = Dash(__name__)

app.layout = html.Div(style={"display": "flex"}, children=[
    # Left: Graphs
    html.Div(style={"flex": "3", "padding": "1rem"}, children=[
        html.H2("Benchmark Plot Viewer"),

        dcc.Graph(id="runtime-plot", style={"border": "1px solid black", "padding": "0.5rem"}),
        dcc.Graph(id="throughput-plot", style={"border": "1px solid black", "padding": "0.5rem"}),
    ]),

    # Right: Controls
    html.Div(style={"flex": "1", "padding": "1rem", "maxWidth": "300px"}, children=[
        html.Label("Select CSV files to include:"),
        dcc.Checklist(
            id="file-selector",
            options=[{"label": f, "value": f} for f in all_files],
            value=all_files,
            style={"overflowY": "auto", "maxHeight": "400px"}
        ),
        html.Br(),
        html.Label("Plot Scale:"),
        dcc.RadioItems(
            id="scale-mode",
            options=[
                {"label": "Linear", "value": "linear"},
                {"label": "Log-X", "value": "log"},
                {"label": "Log-Log", "value": "log-log"}
            ],
            value="linear",
            labelStyle={"display": "inline-block", "margin-right": "10px"}
        )
    ])
])

@app.callback(
    Output("runtime-plot", "figure"),
    Output("throughput-plot", "figure"),
    Input("file-selector", "value"),
    Input("scale-mode", "value")
)
def update_plots(selected_files, scale_mode):
    logx = scale_mode in ["log", "log-log"]
    logy = scale_mode == "log-log"

    if not selected_files:
        return px.line(title="No files selected"), px.line(title="No files selected")

    combined_df = pd.concat([data_frames[f] for f in selected_files], ignore_index=True)

    runtime_fig = px.line(
        combined_df,
        x="batch size",
        y="loop_runtime_seconds",
        color="__label__",
        markers=True,
        title="Loop Runtime vs First Dimension (n1)",
        labels={"n1": "n1", "loop_runtime_seconds": "Runtime (s)"}
    )

    throughput_fig = px.line(
        combined_df,
        x="batch size",
        y="throughput",
        color="__label__",
        markers=True,
        title="Throughput vs First Dimension (n1)",
        labels={"n1": "n1", "throughput": "Throughput (n1 / s)"}
    )

    if logx:
        runtime_fig.update_layout(xaxis_type="log")
        throughput_fig.update_layout(xaxis_type="log")
    if logy:
        runtime_fig.update_layout(yaxis_type="log")
        throughput_fig.update_layout(yaxis_type="log")

    return runtime_fig, throughput_fig

if __name__ == "__main__":
    app.run(debug=True)
