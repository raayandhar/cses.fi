#include <iostream>
#include <vector>
using namespace std;

#define MOD 1000000007

long long diceCombinations(int n) {
  vector<long long> dp(n + 1, 0);
  dp[0] = 1;

  for (int i = 1; i <= n; ++i) {
    for (int j = 1; j <= 6 && j <= i; ++j) {
      dp[i] = (dp[i] + dp[i - j]) % MOD;
    }
  }

  return dp[n] % MOD;
}

int main() {
  int n;
  cin >> n;

  long long result = diceCombinations(n);
  cout << result << endl;

  return 0;
}
