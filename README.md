# 📱 App Usage Behavior Analysis

![Python](https://img.shields.io/badge/Python-3.x-blue) ![MySQL](https://img.shields.io/badge/MySQL-8.0-orange) ![Pandas](https://img.shields.io/badge/Pandas-green) ![Scikit--learn](https://img.shields.io/badge/Scikit--learn-KMeans-red) ![Matplotlib](https://img.shields.io/badge/Matplotlib-purple)

End-to-end analysis on a mobile app usage dataset using **Python and MySQL** — uncovering user engagement patterns, data consumption behavior, addiction levels, and cluster-based user segmentation across 1,249 users and multiple apps.

---

## 📦 Dataset Overview

| Attribute | Value |
|-----------|-------|
| Total Users | 1,249 |
| Total Apps Tracked | 40+ |
| Features per App | Time occupation + Data occupation |
| File | app_used_time.csv |

**Engineered Features:** total_time · total_data · engagement_score · addiction_level · cluster

---

## 📊 Key Findings

| Metric | Value |
|--------|-------|
| Most Used App (Time) | Google — 126.58M |
| Most Used App (Data) | YouTube — 692.38M |
| Addicted Users | 80.1% |
| High Usage Users | 7.9% |
| Moderate Usage Users | 5.4% |
| Low Usage Users | 6.6% |
| Cluster 0 Users | 510 |
| Cluster 1 Users | 333 |
| Cluster 2 Users | 406 |
| Mean Total Time per User | 0.18M |
| Mean Total Data per User | 2.53M |

---

## 💡 Key Insights

- **Google dominates time:** Google alone accounted for ~62% of total time share among top 10 apps; top 3 apps (Google, GoogleServices, HTTP) collectively crossed 80% cumulative usage
- **YouTube dominates data:** YouTube consumed 692.38M data — nearly 25% more than second-ranked GoogleDrive (552.09M)
- **Addiction is widespread:** 80.1% of all 1,249 users classified as Addicted based on engagement score — all 3 clusters dominated by Addicted users
- **Cluster 2 most engaged:** Cluster 2 showed highest avg engagement score; Cluster 1 had highest median data consumption at 2.3M
- **Pareto pattern confirmed:** Top 3 apps account for 80%+ of total time — classic power-law distribution in app usage
- **Engagement by addiction:** Addicted users show ~3.2M avg engagement vs ~0.05M for Low Usage users — 64x difference

---

## 📈 Analysis Performed

- Cleaned and preprocessed raw dataset — handled null values, normalized columns
- Engineered 3 composite features: `total_time`, `total_data`, `engagement_score` across all app columns
- Classified users into 4 addiction levels based on engagement score thresholds:
  - 🟢 Low Usage: score < 50,000
  - 🔵 Moderate Usage: score < 200,000
  - 🟠 High Usage: score < 600,000
  - 🔴 Addicted: score ≥ 600,000
- Applied **K-Means Clustering** (Scikit-learn) — segmented 1,249 users into 3 behavioral clusters
- Ranked top 15 apps by time and top 15 apps by data consumption
- Analyzed Pareto distribution of top 10 apps
- Mapped addiction level breakdown per cluster
- Built **14 visualizations** across 2 dashboards

---

## 📊 Dashboards

### Dashboard 1 — Deep Analytics Dashboard
![Analysis Dashboard](charts/analysis_dashboard.png)

8-panel dashboard covering:
- Top 15 apps by total time (Google: 126.58M · GoogleServices: 16.11M · HTTP: 14.47M)
- Top 15 apps by data consumption (YouTube: 692.38M · GoogleDrive: 552.09M · HTTP: 395.05M)
- User addiction distribution pie chart (Addicted 80.1% · High 7.9% · Moderate 5.4% · Low 6.6%)
- Users per cluster (Cluster 0: 510 · Cluster 1: 333 · Cluster 2: 406)
- Cluster-wise avg time vs data vs engagement comparison
- User scatter plot — Total Time vs Total Data by Cluster
- Avg engagement by addiction level
- Top 10 apps — Time vs Data side-by-side comparison

### Dashboard 2 — Distribution & Deep Insights
![Analysis Deep](charts/analysis_deep.png)

6-panel deep insights covering:
- Distribution of total time per user (Mean: 0.18M) — right-skewed
- Distribution of total data per user (Mean: 2.53M) — right-skewed
- Addiction level breakdown by cluster (stacked bar)
- Time distribution for top 5 apps
- Cluster median time vs data comparison
- Top 10 apps share % — Pareto chart with cumulative % dual axis

---

## 🗄️ SQL Analysis

- Loaded and queried app usage data using MySQL
- Aggregated total time and data per app across all users
- Ranked apps by usage metrics
- Filtered and segmented users by addiction level and cluster
- Cross-analyzed cluster vs addiction level distributions

---

## 🛠️ Tech Stack

| Tool | Purpose |
|------|---------|
| Python | Core analysis and feature engineering |
| Pandas & NumPy | Data cleaning and transformation |
| Matplotlib & Seaborn | 14 charts across 2 dashboards |
| Scikit-learn | K-Means clustering |
| MySQL | Data querying and aggregation |

**Domain:** Digital Analytics · Mobile Behavior · User Segmentation

---

## 📁 Project Structure

    app-usage-behavior-analysis/
    ├── analysis.py
    ├── apps_analysis.sql
    ├── data/
    │   └── app_used_time.csv
    ├── charts/
    │   ├── analysis_dashboard.png
    │   └── analysis_deep.png
    └── README.md

---

## ▶️ How to Run

1. Clone: `git clone https://github.com/tushar-khabrani/app-usage-behavior-analysis`
2. Install dependencies: `pip install pandas numpy matplotlib seaborn scikit-learn`
3. Run: `python analysis.py`

---

## 🤖 AI Integration
Used AI tools to generate Python visualization scripts and dashboard layout — all analytical conclusions, segmentation logic, and insight interpretation independently reviewed and validated.

---

## 👤 Author
**Tushar Khabrani** — [LinkedIn](https://www.linkedin.com/in/tusharkhabrani104) · [GitHub](https://github.com/tushar-khabrani)
