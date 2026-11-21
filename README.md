# checkboxgamingstudio.com

The website of Checkbox Gaming Studio CO. L.L.C S.O.C. It's plain HTML and CSS
with no build step, hosted free on GitHub Pages.

| Page | Path | Used for |
|---|---|---|
| Home | `/` | Apple's Organization check: shows the company and its games |
| Ringleap | `/ringleap/` | Marketing URL in App Store Connect |
| Support | `/support/` | Support URL in App Store Connect (required) |
| Privacy policy | `/privacy/` | Privacy Policy URL in App Store Connect (required) |
| `app-ads.txt` | `/app-ads.txt` | Not added yet. AdMob gives you its one line once the AdMob account exists |

This repository must be **public**: GitHub Pages on a free account only
publishes public repositories. Keep the game's own repository private.

Don't put personal contact details here. Public contact is
`info@checkboxgamingstudio.com` only.

## Preview locally

Open `index.html` in a browser. Links use paths from the site root, such as
`/privacy/`, so for working links run a local server from this folder:

```powershell
powershell -ExecutionPolicy Bypass -File .\serve.ps1   # then open http://localhost:8000
```

## Publish on GitHub Pages

1. Create a **public** repository on GitHub, for example `website`, and push
   this folder to it.
2. In the repository: **Settings → Pages**.
   - **Source:** Deploy from a branch.
   - **Branch:** `main`, folder `/ (root)`. Save.
   - **Custom domain:** `checkboxgamingstudio.com` (already in the `CNAME`
     file). Save.
3. In **GoDaddy → My Products → checkboxgamingstudio.com → DNS**:
   - **Delete** the existing `A` record for `@` (GoDaddy's "Parked" page), and
     the existing `CNAME` for `www`.
   - **Add** four `A` records, name `@`:
     `185.199.108.153`, `185.199.109.153`, `185.199.110.153`, `185.199.111.153`
   - **Add** four `AAAA` records, name `@`:
     `2606:50c0:8000::153`, `2606:50c0:8001::153`, `2606:50c0:8002::153`,
     `2606:50c0:8003::153`
   - **Add** a `CNAME` record, name `www`, value `<your-github-username>.github.io`
   - **Don't touch** the Zoho records: the `MX` records, the `TXT` records
     (`zoho-verification`, `v=spf1 ...`) and the DKIM record. Mail stops if
     they go.
4. Back in **Settings → Pages**, wait until the DNS check passes (minutes to a
   few hours), then tick **Enforce HTTPS**.
5. Recommended: verify the domain for your GitHub account under **your profile
   Settings → Pages → Add a domain**. GitHub gives a `TXT` record to add in
   GoDaddy. This stops anyone else's repository from claiming your domain.
