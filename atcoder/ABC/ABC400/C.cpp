#include <bits/stdc++.h>
#include <iostream>
using namespace std;
#define rep(i, n) for (int i = 0; i < (int)(n); ++i)
typedef long long ll;

bool isPrimeNumber(ll N) // Nが素数かどうか
{
    if (N == 1)
        return false;
    else if (N == 2)
        return true;
    ll i = 3;
    while (i <= sqrt(N))
    {
        if (N % i == 0)
            return false;
        i += 2;
    }
    return true;
}

ll solve(ll N)
{
    ll limit = sqrt(N) + 1;
    ll count = 0;
    for (ll i = 1; i <= limit; i++)
    {
        if (isPrimeNumber(i))
        {
        }
    }
}

int main()
{
    ll N;
    cin >> N;

    ll ans = solve(N);
    cout << ans << endl;
}