#include <bits/stdc++.h>
#include <iostream>
using namespace std;
#define rep(i, n) for (int i = 0; i < (int)(n); ++i)
typedef long long ll;

int main()
{
    // 標準入力
    ll H, W;
    vector<vector<ll>> area(H, vector<ll>(W));
    ll A, B, C, D;
    cin >> H >> W;
    for (ll i = 0; i < H; i++)
    {
        for (ll j = 0; j < W; j++)
        {
            cin >> area[i][j];
        }
    }
    cin >> A >> B >> C >> D;
}