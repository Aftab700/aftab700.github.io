---
title: Privacy Policy
description: Website privacy policy
hidemeta: true
---

- This website was created with [Hugo](https://gohugo.io/) a [Static Site Generator (SSG)](https://en.wikipedia.org/wiki/Static_site_generator "Static Site Generator (SSG) @ Wikipedia") written in [Go](https://go.dev/). It does not use cookies of any kind. This site uses `localStorage`[^1] for the purpose of switching between light and dark themes for UI/UX, with no interaction with the server, only on the client side. There are no forms or other mechanisms that process personal data.
- This Website is hosted in [Cloudflare Pages](https://pages.cloudflare.com/). Cloudflare may collect user personal information from visitors to this website, including logs of visitor IP addresses, to comply with legal obligations, and to maintain the security and integrity of the website and the service. See the Cloudflare Privacy Statement for details.[^2]
- All external links open in a new tab and by default are told not to send a referrer in the header. I do not use an anonymizing service so that you will know exactly where the link will take you to. Also, I use `noopener` attribute, which prevents the opening page to gain any kind of access to the original page.
- If any external links are missing the `rel="external nofollow noopener noreferrer"`[^3] let me know and I'll update it ASAP.
- To enhance the website's security, I have implemented several HTTP security headers[^4] such as [Content-Security-Policy](https://developer.mozilla.org/en-US/docs/Web/HTTP/CSP), [Strict-Transport-Security](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Strict-Transport-Security), [X-Content-Type-Options](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Content-Type-Options), [Referrer-Policy](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Referrer-Policy), [X-Frame-Options](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Frame-Options), [Cross-Origin-Opener-Policy](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Cross-Origin-Opener-Policy) and [Permissions-Policy](https://developer.mozilla.org/en-US/docs/Web/HTTP/Permissions_Policy).
- I will never add user tracking/analytics of any type because I simply do not care. I don't care how popular the site is or isn't - _it exists for my personal satisfaction_.
- Apart from this, no data is collected, stored or evaluated. No ads, no tracking/analytics, just my articles to read.

[^1]: [MDN Web Docs: Web Storage API](https://developer.mozilla.org/en-US/docs/Web/API/Web_Storage_API "Web Storage API @ MDN Web Docs") & [MDN Web Docs: Local Storage](https://developer.mozilla.org/en-US/docs/Web/API/Window/localStorage "localStorage @ MDN Web Docs")
[^2]: [Cloudflare's Privacy Statement](https://www.cloudflare.com/privacypolicy/) & [Cloudflare's General Data Protection Regulation (GDPR)](https://www.cloudflare.com/trust-hub/gdpr/)
[^3]: [MDN Web Docs: Link types](https://developer.mozilla.org/en-US/docs/Web/HTML/Link_types "Link types @ MDN Web Docs")
[^4]: [HTTP Security Response Headers](https://cheatsheetseries.owasp.org/cheatsheets/HTTP_Headers_Cheat_Sheet.html)