from pulp import LpMinimize, LpProblem, LpVariable, lpSum

# 問題の定義
prob = LpProblem("Vertex_Cover", LpMinimize)

# 変数定義 (0 <= x_i <= 1)
x = [LpVariable(f"x{i + 1}", 0, 1) for i in range(5)]

# 目的関数: 最小化 ∑x_i
prob += lpSum(x), "Objective"

# 制約条件: 各辺をカバー
prob += x[0] + x[1] >= 1  # e1: v1-v2
prob += x[1] + x[2] >= 1  # e2: v2-v3
prob += x[2] + x[3] >= 1  # e3: v3-v4
prob += x[3] + x[4] >= 1  # e4: v4-v5
prob += x[4] + x[0] >= 1  # e5: v5-v1
prob += x[1] + x[3] >= 1  # e6: v2-v4

# 問題を解く
prob.solve()

# 結果の表示
print("Status:", prob.status)
print("Objective Value (Minimum Vertex Cover):", prob.objective.value())
for i in range(5):
    print(f"x{i + 1} = {x[i].varValue}")
