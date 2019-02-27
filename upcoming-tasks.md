# Task 2 - Generate PKI

Cats being the controlling creatures they are want to control the CA.

Set up a CA on cat_host using the `ipsec pki` tool, the CA needs to be uber secure so use the algorithms listed here: https://www.ncsc.gov.uk/guidance/using-ipsec-protect-data#PRIME

For example to start you need to generate a private key for the CA
```
mkdir ca
cd ca
ipsec pki --gen --type ecdsa --size 256 --outform pem > ca-key.pem
```
Note: I used the outform PEM here is it's easier to copy and paste to other boxes, this will be useful later



# Task 3 - Configure and establish VPN

# Task 4 - Exploit VPN

The dolphins want in on the action too, but the cats aren't giving them a certificate!

+-----------------------+         +----------------------+         +-----------------------+
|                       |         |                      |         |                       |
|  cat_host             |         |  is_router           |         |  dog_host             |
|  IP: 10.10.10.2/24    +---------+  en0: 10.10.10.1/24  +---------+  IP: 10.20.20.2/24    |
|  Gateway: 10.10.10.1  |         |  en1: 10.20.20.1/24  |         |  Gateway: 10.20.20.1  |
|                       |         |                      |         |                       |
+-----------------------+         +-----------+----------+         +-----------------------+
                                              |
                                              |
                                              |
                                  +-----------+----------+
                                  |                      |
                                  |  dolphin_host        |
                                  |  IP: 10.20.20.3/24   |
                                  |  Gateway: 10.20.20.1 |
                                  |                      |
                                  +----------------------+

