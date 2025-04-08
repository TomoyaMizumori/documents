#include <bits/stdc++.h>
#include <iostream>
using namespace std;
#define rep(i, n) for (int i = 0; i < (int)(n); ++i)
typedef long long ll;

ll solve(ll A, ll B)
{
    // 等比級数の和
    //  S = a1 * (1 - r^n) / (1 - r)
    //  a1 = 1, r = A, n = B
    ll num = 0;
    ll now = 1;
    for (ll i = 0; i <= B; i++)
    {
        num += now;
        now *= A;
        if (num > 1e9) // 1e9以上のときはinf
            return -1;
    }

    return num;
}

int main()
{
    ll A, B;
    cin >> A >> B;

    ll ans = solve(A, B);
    if (ans == -1)
        cout << "inf" << endl;
    else
        cout << ans << endl;
}