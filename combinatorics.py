m, n = map(int, input().split())
print(m * n * (n - 1) // 2 + m * (m - 1) * (m - 2) // 6)
