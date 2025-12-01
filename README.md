# Docusaurus Docker Search

Repository structure shown in the project tree includes GitHub workflow automation, a Docusaurus webpage directory, Docker configuration, and Nginx setup for serving the static build.


## Overview

This project provides a Docusaurus documentation site bundled with Docker support. The `webpage` directory contains all site sources, while Docker and Nginx configurations enable containerized static hosting.

## Requirements

Node.js 18 or newer  
npm 8 or newer  
Docker optional for container deployment

## Installation

```bash
git clone https://github.com/CagriCatik/docusaurus-docker-search.git
cd docusaurus-docker-search/webpage
npm install
```

## Development

Start the local development server:

```bash
npm run start
```

The site is served at [http://localhost:3000](http://localhost:3000).

## Build

Create a production build:

```bash
npm run build
```

The output is placed under the top-level `build` directory.

## Deployment

### GitHub Pages

A GitHub Actions workflow exists under `.github/workflows/deploy.yml`.

### Generic Static Hosting

Upload the contents of `build/` to any static host.

## Docker

### Build Image

```bash
docker build -t docusaurus-site .
```

### Run Container

```bash
docker run -d --name docs -p 80:80 docusaurus-site
```

Nginx serves the static output using the provided `nginx.conf`.

### .dockerignore

```
node_modules
build
.DS_Store
```

## Configuration Notes

docusaurus.config.js defines global site settings.
sidebars.js configures documentation sidebars.
The `src` and `static` directories contain site code and assets.

## Troubleshooting

Port already in use: modify exposed port in the Docker run command.
Version errors: verify Node.js and npm versions.
Stale assets: clear browser cache or rebuild.
