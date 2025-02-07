from pulp import LpMaximize, LpProblem, LpVariable, lpSum

# 問題を定義（最大化）
prob = LpProblem("Integer_Dual_Problem", LpMaximize)

# 変数定義（各辺に対応する y_e ∈ {0, 1}）
y = [LpVariable(f"y{i + 1}", 0, 1, cat="Binary") for i in range(6)]

# 目的関数: 最大化 ∑y_e
prob += lpSum(y), "Objective"

# 制約条件: 各頂点に関する制約
# 頂点 v1 の制約
prob += y[0] + y[4] <= 1  # e1, e5
# 頂点 v2 の制約
prob += y[0] + y[1] + y[5] <= 1  # e1, e2, e6
# 頂点 v3 の制約
prob += y[1] + y[2] <= 1  # e2, e3
# 頂点 v4 の制約
prob += y[2] + y[3] + y[5] <= 1  # e3, e4, e6
# 頂点 v5 の制約
prob += y[3] + y[4] <= 1  # e4, e5

# 問題を解く
prob.solve()

# 結果の出力
print("Objective Value (Maximum):", prob.objective.value())
for i in range(6):
    print(f"y{i + 1} =", y[i].varValue)
