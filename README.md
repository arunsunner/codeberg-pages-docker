
# codeberg-pages-docker

Use Codeberg Pages on your own self-hosted Gitea instance using Docker.

## Usage instructions

+ Add a .domains file to your repository. Multiple domains can be added using line breaks.
+ Add a CNAME entry to the domain in your DNS server/provider's panel
	`custom.domain. IN CNAME branch.repo.owner.pages.domain`

(For example, to have the 'pages' branch on https://git.example.com/admin/pages-repo point to example.org, it would be `example.org. IN CNAME pages.pages-repo.admin.git.example.com`)

## Environment variables

These can be set either in the Dockerfile or in whichever Docker client application you use.

| **Variable name** | **Purpose** | **Default value** |
|-------------------|-------------|-------------------|
| PAGES_DOMAIN |  _The domain your pages should be served from_ | pages.domain   |
| GITEA_ROOT |  _The domain your Gitea instance is served from_ | https://git.domain |
| GITEA_API_TOKEN | _An (optional) requirement for accessing private repos_	| _<not set\>_
| RAW_DOMAIN | _The domain raw resources (for resources outside the 'pages' branch) to be hosted on_ | raw.pages.domain
| RAW_INFO_PAGE | _The page loaded if a request for a raw resource returns 404_ | _<not set\>_
| ACME_API | _The domain ACME requests for certificate renewals will be made_ | https://acme.mock.directory 
| ACME_EMAIL | _The email address sent to the ACME provider during requests_ | noreply@example.email
| ACME_USE_RATE_LIMITS | _Defines whether requests to the ACME server are rate-limited_ | true
| DNS_PROVIDER | _The DNS provider used to validate requests for ACME certificates_ | _<not set\>_
| ENABLE_HTTP_SERVER | _Enable HTTP requests (on port 80) to be made to the Pages server_ | true
