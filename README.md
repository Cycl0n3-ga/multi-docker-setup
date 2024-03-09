# SSH Server with Docker

This Dockerfile and Docker Compose configuration sets up an Ubuntu container with an SSH server and various ports exposed. It also installs Docker inside the container.

## Usage

### Building the Docker image

```bash
docker build -t ubuntu_ssh .
```

### Running with Docker Compose

```bash
docker-compose up -d
```

## SSH Access

You can SSH into the container with the following command:

```bash
ssh root@localhost -p <port_number>
```

Replace `<port_number>` with one of the following exposed ports:

- 10022 for `ubuntu_leo`
- 20022 for `ubuntu_cyclone`
- 30022 for `ubuntu_yihua`

The default password for SSH is `mitlab`.

## Exposed Ports

- SSH: 22
- HTTP: 80
- HTTPS: 443
- PostgreSQL: 5432
- Custom Service: 8000

## Docker Compose Services

- `ubuntu_leo`
- `ubuntu_cyclone`
- `ubuntu_yihua`

Each service exposes the same ports as mentioned above but on different host port ranges.

```
ubuntu_leo:
  - "10022:22" 
  - "10080:80" 
  - "10443:443" 
  - "15432:5432" 
  - "18000:8000" 
```

```
ubuntu_cyclone:
  - "20022:22" 
  - "20080:80" 
  - "20443:443" 
  - "25432:5432" 
  - "28000:8000" 
```

```
ubuntu_yihua:
  - "30022:22" 
  - "30080:80" 
  - "30443:443" 
  - "35432:5432" 
  - "38000:8000" 
```

