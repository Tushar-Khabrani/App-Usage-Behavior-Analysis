import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.patches as mpatches
import seaborn as sns
import warnings
warnings.filterwarnings('ignore')

plt.rcParams['figure.facecolor'] = '#0f0f1a'
plt.rcParams['axes.facecolor'] = '#1a1a2e'
plt.rcParams['axes.edgecolor'] = '#444466'
plt.rcParams['text.color'] = 'white'
plt.rcParams['axes.labelcolor'] = 'white'
plt.rcParams['xtick.color'] = 'white'
plt.rcParams['ytick.color'] = 'white'
plt.rcParams['grid.color'] = '#333355'
plt.rcParams['grid.alpha'] = 0.4
plt.rcParams['font.family'] = 'DejaVu Sans'

df = pd.read_csv(r'C:\Users\Tushar\OneDrive\Desktop\project4\app_used_time.csv')
df.fillna(0, inplace=True)

time_cols = [c for c in df.columns if c.endswith('_time_occupation')]
data_cols = [c for c in df.columns if c.endswith('_data_occupation')]

app_names = [c.replace('_time_occupation','') for c in time_cols]

df['total_time'] = df[time_cols].sum(axis=1)
df['total_data'] = df[data_cols].sum(axis=1)
df['engagement_score'] = df['total_time'] + df['total_data']

def addiction_label(score):
    if score < 50000: return 'Low Usage'
    elif score < 200000: return 'Moderate Usage'
    elif score < 600000: return 'High Usage'
    else: return 'Addicted'

df['addiction_level'] = df['engagement_score'].apply(addiction_label)

app_time_totals = df[time_cols].sum()
app_time_totals.index = app_names
app_time_totals = app_time_totals.sort_values(ascending=False)

app_data_totals = df[data_cols].sum()
app_data_totals.index = [c.replace('_data_occupation','') for c in data_cols]
app_data_totals = app_data_totals.sort_values(ascending=False)

COLORS = ['#7c3aed','#2563eb','#0891b2','#059669','#d97706','#dc2626','#db2777','#16a34a','#9333ea','#0284c7']
GRAD = ['#7c3aed','#a855f7','#c084fc','#ddd6fe','#ede9fe']

fig = plt.figure(figsize=(22, 28))
fig.patch.set_facecolor('#0f0f1a')
fig.suptitle('APP USAGE BEHAVIOR — DEEP ANALYTICS DASHBOARD', fontsize=22, fontweight='bold', color='white', y=0.98)

gs = fig.add_gridspec(5, 3, hspace=0.55, wspace=0.35)

ax1 = fig.add_subplot(gs[0, :2])
top15_time = app_time_totals.head(15)
bars = ax1.barh(range(len(top15_time)), top15_time.values / 1e6, color=[COLORS[i % len(COLORS)] for i in range(len(top15_time))], edgecolor='none', height=0.7)
ax1.set_yticks(range(len(top15_time)))
ax1.set_yticklabels(top15_time.index, fontsize=10)
ax1.invert_yaxis()
ax1.set_title('Top 15 Most Used Apps (Total Time — Millions)', fontsize=13, fontweight='bold', pad=10, color='#a78bfa')
ax1.set_xlabel('Total Time (Millions)', fontsize=10)
ax1.grid(axis='x', alpha=0.3)
for i, (bar, val) in enumerate(zip(bars, top15_time.values)):
    ax1.text(bar.get_width() + 0.02, bar.get_y() + bar.get_height()/2, f'{val/1e6:.2f}M', va='center', fontsize=8, color='white')

ax2 = fig.add_subplot(gs[0, 2])
addiction_counts = df['addiction_level'].value_counts()
order = ['Low Usage','Moderate Usage','High Usage','Addicted']
addiction_counts = addiction_counts.reindex(order).fillna(0)
pie_colors = ['#059669','#2563eb','#d97706','#dc2626']
wedges, texts, autotexts = ax2.pie(addiction_counts.values, labels=addiction_counts.index, autopct='%1.1f%%',
    colors=pie_colors, startangle=90, textprops={'fontsize': 9, 'color': 'white'},
    wedgeprops={'edgecolor': '#0f0f1a', 'linewidth': 2})
for at in autotexts:
    at.set_fontsize(9)
    at.set_color('white')
ax2.set_title('User Addiction Distribution', fontsize=13, fontweight='bold', pad=10, color='#a78bfa')

ax3 = fig.add_subplot(gs[1, :2])
top15_data = app_data_totals.head(15)
bars3 = ax3.barh(range(len(top15_data)), top15_data.values / 1e6, color=[COLORS[(i+3) % len(COLORS)] for i in range(len(top15_data))], edgecolor='none', height=0.7)
ax3.set_yticks(range(len(top15_data)))
ax3.set_yticklabels(top15_data.index, fontsize=10)
ax3.invert_yaxis()
ax3.set_title('Top 15 Apps by Data Consumption (Millions)', fontsize=13, fontweight='bold', pad=10, color='#a78bfa')
ax3.set_xlabel('Total Data (Millions)', fontsize=10)
ax3.grid(axis='x', alpha=0.3)
for bar, val in zip(bars3, top15_data.values):
    ax3.text(bar.get_width() + 0.02, bar.get_y() + bar.get_height()/2, f'{val/1e6:.2f}M', va='center', fontsize=8, color='white')

ax4 = fig.add_subplot(gs[1, 2])
cluster_counts = df['cluster'].value_counts().sort_index()
cluster_colors = ['#7c3aed','#2563eb','#059669']
bars4 = ax4.bar([f'Cluster {i}' for i in cluster_counts.index], cluster_counts.values, color=cluster_colors, edgecolor='none', width=0.5)
ax4.set_title('Users per Cluster', fontsize=13, fontweight='bold', pad=10, color='#a78bfa')
ax4.set_ylabel('User Count', fontsize=10)
ax4.grid(axis='y', alpha=0.3)
for bar, val in zip(bars4, cluster_counts.values):
    ax4.text(bar.get_x() + bar.get_width()/2, bar.get_height() + 5, str(int(val)), ha='center', fontsize=11, fontweight='bold', color='white')

ax5 = fig.add_subplot(gs[2, :])
cluster_time = df.groupby('cluster')['total_time'].mean()
cluster_data = df.groupby('cluster')['total_data'].mean()
cluster_eng = df.groupby('cluster')['engagement_score'].mean()
x = np.arange(len(cluster_counts.index))
width = 0.25
b1 = ax5.bar(x - width, cluster_time.values / 1e6, width, label='Avg Time (M)', color='#7c3aed', edgecolor='none')
b2 = ax5.bar(x, cluster_data.values / 1e6, width, label='Avg Data (M)', color='#2563eb', edgecolor='none')
b3 = ax5.bar(x + width, cluster_eng.values / 1e6, width, label='Avg Engagement (M)', color='#059669', edgecolor='none')
ax5.set_xticks(x)
ax5.set_xticklabels([f'Cluster {i}' for i in cluster_counts.index], fontsize=11)
ax5.set_title('Cluster-wise Avg Time vs Data vs Engagement', fontsize=13, fontweight='bold', pad=10, color='#a78bfa')
ax5.set_ylabel('Value (Millions)', fontsize=10)
ax5.legend(fontsize=9, facecolor='#1a1a2e', edgecolor='#444466', labelcolor='white')
ax5.grid(axis='y', alpha=0.3)

ax6 = fig.add_subplot(gs[3, :2])
ax6.scatter(df['total_time']/1e6, df['total_data']/1e6, c=df['cluster'],
    cmap='plasma', alpha=0.5, s=20, edgecolors='none')
ax6.set_title('User Scatter: Total Time vs Total Data (by Cluster)', fontsize=13, fontweight='bold', pad=10, color='#a78bfa')
ax6.set_xlabel('Total Time (Millions)', fontsize=10)
ax6.set_ylabel('Total Data (Millions)', fontsize=10)
ax6.grid(alpha=0.3)
patches = [mpatches.Patch(color=plt.cm.plasma(i/2), label=f'Cluster {i}') for i in range(3)]
ax6.legend(handles=patches, fontsize=9, facecolor='#1a1a2e', edgecolor='#444466', labelcolor='white')

ax7 = fig.add_subplot(gs[3, 2])
eng_by_addiction = df.groupby('addiction_level')['engagement_score'].mean().reindex(order)
bar_colors = ['#059669','#2563eb','#d97706','#dc2626']
bars7 = ax7.bar(range(len(eng_by_addiction)), eng_by_addiction.values / 1e6, color=bar_colors, edgecolor='none', width=0.5)
ax7.set_xticks(range(len(eng_by_addiction)))
ax7.set_xticklabels(['Low','Moderate','High','Addicted'], fontsize=9)
ax7.set_title('Avg Engagement by Addiction Level', fontsize=12, fontweight='bold', pad=10, color='#a78bfa')
ax7.set_ylabel('Avg Engagement (M)', fontsize=9)
ax7.grid(axis='y', alpha=0.3)

ax8 = fig.add_subplot(gs[4, :])
top10_time = app_time_totals.head(10)
top10_data = app_data_totals.reindex(top10_time.index)
x8 = np.arange(len(top10_time))
w = 0.35
ax8.bar(x8 - w/2, top10_time.values / 1e6, w, label='Time', color='#7c3aed', edgecolor='none')
ax8.bar(x8 + w/2, top10_data.values / 1e6, w, label='Data', color='#0891b2', edgecolor='none')
ax8.set_xticks(x8)
ax8.set_xticklabels(top10_time.index, rotation=30, ha='right', fontsize=10)
ax8.set_title('Top 10 Apps — Time vs Data Comparison', fontsize=13, fontweight='bold', pad=10, color='#a78bfa')
ax8.set_ylabel('Value (Millions)', fontsize=10)
ax8.legend(fontsize=10, facecolor='#1a1a2e', edgecolor='#444466', labelcolor='white')
ax8.grid(axis='y', alpha=0.3)

plt.savefig('/home/claude/analysis_dashboard.png', dpi=150, bbox_inches='tight', facecolor='#0f0f1a')
plt.close()
print("Dashboard saved!")

fig2, axes = plt.subplots(2, 3, figsize=(22, 14))
fig2.patch.set_facecolor('#0f0f1a')
fig2.suptitle('APP USAGE — DISTRIBUTION & DEEP INSIGHTS', fontsize=20, fontweight='bold', color='white', y=0.98)

ax = axes[0, 0]
ax.set_facecolor('#1a1a2e')
ax.hist(df['total_time']/1e6, bins=50, color='#7c3aed', edgecolor='none', alpha=0.85)
ax.axvline(df['total_time'].mean()/1e6, color='#f59e0b', linestyle='--', linewidth=2, label=f"Mean: {df['total_time'].mean()/1e6:.2f}M")
ax.set_title('Distribution of Total Time per User', fontsize=12, fontweight='bold', color='#a78bfa')
ax.set_xlabel('Total Time (Millions)', fontsize=10)
ax.set_ylabel('Users', fontsize=10)
ax.legend(fontsize=9, facecolor='#1a1a2e', labelcolor='white')
ax.grid(alpha=0.3)

ax = axes[0, 1]
ax.set_facecolor('#1a1a2e')
ax.hist(df['total_data']/1e6, bins=50, color='#0891b2', edgecolor='none', alpha=0.85)
ax.axvline(df['total_data'].mean()/1e6, color='#f59e0b', linestyle='--', linewidth=2, label=f"Mean: {df['total_data'].mean()/1e6:.2f}M")
ax.set_title('Distribution of Total Data per User', fontsize=12, fontweight='bold', color='#a78bfa')
ax.set_xlabel('Total Data (Millions)', fontsize=10)
ax.set_ylabel('Users', fontsize=10)
ax.legend(fontsize=9, facecolor='#1a1a2e', labelcolor='white')
ax.grid(alpha=0.3)

ax = axes[0, 2]
ax.set_facecolor('#1a1a2e')
addiction_cluster = df.groupby(['cluster','addiction_level']).size().unstack(fill_value=0)
addiction_cluster = addiction_cluster.reindex(columns=order, fill_value=0)
bottom = np.zeros(len(addiction_cluster))
for i, col in enumerate(order):
    ax.bar([f'Cluster {c}' for c in addiction_cluster.index], addiction_cluster[col].values,
           bottom=bottom, label=col, color=['#059669','#2563eb','#d97706','#dc2626'][i], edgecolor='none')
    bottom += addiction_cluster[col].values
ax.set_title('Addiction Level by Cluster', fontsize=12, fontweight='bold', color='#a78bfa')
ax.set_ylabel('Users', fontsize=10)
ax.legend(fontsize=8, facecolor='#1a1a2e', edgecolor='#444466', labelcolor='white')
ax.grid(axis='y', alpha=0.3)

ax = axes[1, 0]
ax.set_facecolor('#1a1a2e')
top5_apps = app_time_totals.head(5).index.tolist()
for i, app in enumerate(top5_apps):
    col = f'{app}_time_occupation'
    if col in df.columns:
        vals = df[col][df[col] > 0] / 1e3
        ax.hist(vals, bins=30, alpha=0.6, label=app, color=COLORS[i], edgecolor='none')
ax.set_title('Time Distribution — Top 5 Apps', fontsize=12, fontweight='bold', color='#a78bfa')
ax.set_xlabel('Time (Thousands)', fontsize=10)
ax.set_ylabel('Users', fontsize=10)
ax.legend(fontsize=8, facecolor='#1a1a2e', labelcolor='white')
ax.grid(alpha=0.3)

ax = axes[1, 1]
ax.set_facecolor('#1a1a2e')
cluster_medians = df.groupby('cluster')[['total_time','total_data']].median() / 1e6
x_pos = np.arange(len(cluster_medians))
w = 0.35
ax.bar(x_pos - w/2, cluster_medians['total_time'], w, color='#7c3aed', label='Median Time', edgecolor='none')
ax.bar(x_pos + w/2, cluster_medians['total_data'], w, color='#0891b2', label='Median Data', edgecolor='none')
ax.set_xticks(x_pos)
ax.set_xticklabels([f'Cluster {i}' for i in cluster_medians.index])
ax.set_title('Cluster Median Time vs Data', fontsize=12, fontweight='bold', color='#a78bfa')
ax.set_ylabel('Median Value (Millions)', fontsize=10)
ax.legend(fontsize=9, facecolor='#1a1a2e', labelcolor='white')
ax.grid(axis='y', alpha=0.3)

ax = axes[1, 2]
ax.set_facecolor('#1a1a2e')
top10 = app_time_totals.head(10)
total = top10.sum()
pcts = top10.values / total * 100
cumulative = np.cumsum(pcts)
bars_p = ax.bar(range(len(top10)), pcts, color=COLORS[:len(top10)], edgecolor='none', alpha=0.85)
ax2_twin = ax.twinx()
ax2_twin.plot(range(len(top10)), cumulative, color='#f59e0b', marker='o', markersize=5, linewidth=2, label='Cumulative %')
ax2_twin.set_ylabel('Cumulative %', color='#f59e0b', fontsize=10)
ax2_twin.tick_params(colors='#f59e0b')
ax2_twin.set_ylim(0, 110)
ax.set_xticks(range(len(top10)))
ax.set_xticklabels(top10.index, rotation=30, ha='right', fontsize=9)
ax.set_title('Top 10 Apps — Share % (Pareto)', fontsize=12, fontweight='bold', color='#a78bfa')
ax.set_ylabel('Time Share %', fontsize=10)
ax.grid(axis='y', alpha=0.3)

for a in axes.flat:
    a.set_facecolor('#1a1a2e')
    a.tick_params(colors='white')

plt.tight_layout(rect=[0, 0, 1, 0.96])
plt.savefig('/home/claude/analysis_deep.png', dpi=150, bbox_inches='tight', facecolor='#0f0f1a')
plt.close()
print("Deep analysis saved!")

print("\n===== QUICK STATS =====")
print(f"Total Users: {len(df)}")
print(f"Total Apps: {len(time_cols)}")
print(f"Most Used App (Time): {app_time_totals.index[0]}")
print(f"Most Used App (Data): {app_data_totals.index[0]}")
print(f"Addiction Distribution:\n{df['addiction_level'].value_counts()}")
print(f"Cluster Distribution:\n{df['cluster'].value_counts().sort_index()}")