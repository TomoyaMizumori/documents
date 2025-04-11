#include <bits/stdc++.h>
#include <iostream>
using namespace std;
#define rep(i, n) for (int i = 0; i < (int)(n); ++i)
typedef long long ll;

ll solve(ll N)
{
    ll ans = 0;
    ll p = 0;
    ll q = 1e9;
    ll m;
    while (p + 1 < q)
    {
        m = (p + q) / 2;
        if (2 * m * m > N)
        {
            q = m;
        }
        else
        {
            p = m;
        }
    }
    ans += p;
    p = 0;
    q = 1e9;
    while (p + 1 < q)
    {
        m = (p + q) / 2;
        if (4 * m * m > N)
        {
            q = m;
        }
        else
        {
            p = m;
        }
    }
    ans += p;
    return ans;
}

int main()
{
    ll N;
    cin >> N;

    ll ans = solve(N);
    cout << ans << endl;
}